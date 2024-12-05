class AddSlugToCafe < ActiveRecord::Migration[7.2]
  def change
    add_column :cafes, :slug, :string
  end
end
