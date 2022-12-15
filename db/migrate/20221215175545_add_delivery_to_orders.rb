class AddDeliveryToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivery, :string
  end
end
