class AddSlugToCoffeeGift < ActiveRecord::Migration[7.2]
  def change
    add_column :coffee_gifts, :slug, :string
  end
end
