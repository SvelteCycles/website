class AddColumnToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :inventory, index: true, foreign_key: true
  end
end
