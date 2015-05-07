class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index:true
      t.string :name
      t.integer :price
      t.text :description
      t.text :details

      t.timestamps null: false
    end
  end
end
