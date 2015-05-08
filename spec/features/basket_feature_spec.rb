require 'rails_helper'

feature 'shopping basket' do

  before(:each) do
    @jersey = Product.create(name: 'Womens Jersey', price: 99)
    @women = Gender.create! id: 2, sex: 'female'
    Inventory.create(product_id: @jersey.id, gender_id: @women.id)
    OrderStatus.create! id: 1, name: "In Progress"
  end

  context 'adding products to the basket' do

    scenario 'from a product page', js: true do
      visit "/women/jerseys/#{@jersey.id}"
      click_button 'Add To Bag'
      expect(page).to have_content 'Cart Items: 1'
    end

  end

  context 'deleting products from the basket' do

    xscenario 'from the basket page', js: true do
      visit "/women/jerseys/#{@jersey.id}"
      click_button 'Add To Bag'
      expect(page).to have_content "Cart Items: 1"
      visit "/basket"
      click_link 'Delete'
      expect(page).to have_content "There are no items in your basket"
    end
  end

end
