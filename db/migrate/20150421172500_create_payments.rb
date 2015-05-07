class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :orders
  end
end
