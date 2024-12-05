class AddPictureToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :picture, :string
  end
end
