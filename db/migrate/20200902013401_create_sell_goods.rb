class CreateSellGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_goods do |t|
      t.string :name
      t.integer :prise
      t.integer :user_id
      t.integer :status
      t.string :cost
      t.string :size
      t.integer :category
      t.integer :shipping_cost
      t.integer :shipping_days
      t.integer :shipping_prefecture
      t.timestamps
    end
  end
end
