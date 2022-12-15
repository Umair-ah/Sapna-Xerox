class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :paper_size
      t.string :color
      t.integer :quantity
      t.string :paper_style
      t.text :description
      

      t.timestamps
    end
  end
end
