class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id       ,null: false
      t.integer :sell_good_id  ,null: false
      t.timestamps
    end
  end
end
