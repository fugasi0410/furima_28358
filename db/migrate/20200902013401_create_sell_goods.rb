class CreateSellGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_goods do |t|
      t.string :name
      t.integer :price
      t.integer :user_id
      t.integer :status
      t.integer :size_id
      t.integer :category_id
      t.integer :shipping_cost_id
      t.integer :shipping_day_id
      t.integer :shipping_prefecture_id
      t.timestamps
    end
  end
end
