class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :menu_item, null: false, foreign_key: true
      t.integer :quantity
      t.string :menu_item_name
      t.decimal :menu_item_price

      t.timestamps
    end
  end
end
