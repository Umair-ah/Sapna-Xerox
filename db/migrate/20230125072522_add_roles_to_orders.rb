class AddRolesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :roles, :jsonb, null: false, default: {}
    add_index  :orders, :roles, using: :gin
  end
end
