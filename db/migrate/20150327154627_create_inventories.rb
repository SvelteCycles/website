class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to :product, index: true
      t.belongs_to :gender, index: true
      t.belongs_to :size , index: true
      t.belongs_to :colour , index: true
      t.string :sku
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
