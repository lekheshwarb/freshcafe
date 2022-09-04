class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :is_out_of_stock
      t.decimal :production_cost
      t.belongs_to :menu_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
