class RemoveAddressColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :location
  end
end
