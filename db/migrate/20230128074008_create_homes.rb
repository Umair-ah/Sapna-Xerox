class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string :address
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
