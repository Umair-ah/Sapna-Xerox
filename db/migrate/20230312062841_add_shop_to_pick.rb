class AddShopToPick < ActiveRecord::Migration[7.0]
  def change
    add_column :picks, :shop, :string
  end
end
