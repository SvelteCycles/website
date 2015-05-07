class AddShippingDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :email, :string
    add_column :orders, :shipping_name, :string
    add_column :orders, :shipping_address_line_1, :string
    add_column :orders, :shipping_address_zip, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_country, :string
    add_column :orders, :shipping_country_code, :string
  end
end
