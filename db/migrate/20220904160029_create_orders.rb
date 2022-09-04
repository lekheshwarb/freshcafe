class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :delivered_at
      t.string :status
      t.text :instructions

      t.timestamps
    end
  end
end
