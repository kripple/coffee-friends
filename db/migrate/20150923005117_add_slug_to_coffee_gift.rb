class AddSlugToCoffeeGift < ActiveRecord::Migration[6.1]
  def change
    add_column :coffee_gifts, :slug, :string
  end
end
