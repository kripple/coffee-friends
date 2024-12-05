class CreateMenuItems < ActiveRecord::Migration[7.2]
  def change
    create_table :menu_items do |t|
    	t.references :cafe
    	t.string :name, null:false, limit:30
    	t.float :price, null:false
      t.timestamps
    end
  end
end
