class ChangeDateToDateTimeInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column(:orders, :delivered_at, :datetime)
  end
end
