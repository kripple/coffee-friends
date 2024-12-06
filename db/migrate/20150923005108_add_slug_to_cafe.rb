class AddSlugToCafe < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :slug, :string
  end
end
