class CoffeeGiftsController < ApplicationController

	before_action :authenticate_user, except: [:update, :filter]
	before_action :find_coffee_gift, except: [:new, :create, :filter]
	before_action :authorize_user, only: [:show]

	def new
		if request.xhr?
			@cafe = Cafe.find_by(id: params[:cafe_id])
		else
			@cafe = Cafe.find_by_slug(params[:cafe_id])
		end
		@menu_items = @cafe.menu_items
		@receivers = User.all
		@coffee_gift = CoffeeGift.new
		render :new, layout: !request.xhr?
	end

	def create
		cafe = Cafe.find_by(id: params[:cafe_id])
		coffee_gift = current_user.given_coffees.build(coffee_gift_params)
		coffee_gift.assign_phone(params[:coffee_gift])
		if coffee_gift.save
			session[:tmp_id] = nil
			session[:tmp_id] = coffee_gift.id
			session[:tmp_price] = coffee_gift.price
			redirect_to new_transaction_path
		else
			coffee_gift.destroy
			flash[:error] = coffee_gift.errors.full_messages
			redirect_to new_cafe_coffee_gift_path(cafe)
		end
	end

	def update
		if @coffee_gift.update_attributes(redeemed: true)
			flash[:notice] = "Coffee Redeemed!"
			TwilioTextSender.send!(@coffee_gift)
			redirect_to cafes_profile_path
		else
			flash[:error] = ["Unable to redeem voucher"]
			redirect_to cafes_profile_path
		end
	end

	def show
		@cafe = @coffee_gift.cafe
	end

	def confirm
		@cafe = @coffee_gift.cafe
	end

	private

	def find_coffee_gift
		@coffee_gift = CoffeeGift.find_by_slug(params[:id])
	end

	def authorize_user
		find_coffee_gift
		unless current_user.sent_or_received_coffee?(@coffee_gift)
			redirect_to root_path
		end
	end

	def authenticate_user
		unless current_user
			flash[:error] = ["Please login to send coffee."]
			redirect_to root_path
		end
	end

	def coffee_gift_params
		params.require(:coffee_gift).permit(:message, :phone, :charitable)
	end

end
