class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_code     ,null: false
      t.integer :prefecture_id ,null: false
      t.string  :city          ,null: false
      t.string  :street_number ,null: false
      t.string  :building_name ,null: false
      t.string  :phone_number  ,null: false
      t.integer :order_id      ,null: false
      t.timestamps
    end
  end
end
