class AddPictureToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :picture, :string
  end
end
