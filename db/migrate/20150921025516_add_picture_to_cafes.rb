class AddPictureToCafes < ActiveRecord::Migration[7.2]
  def change
    add_column :cafes, :picture, :string
  end
end
