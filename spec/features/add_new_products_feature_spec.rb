require 'rails_helper'

feature 'Product page' do

  before(:each) do
    Product.create(name: "continental jersey", price: 50, description: "racing")
  end

  context 'adding new products' do

    scenario 'prompts the user to fill in a form' do
      visit '/admin'
      click_link 'Add New Product'
      fill_in 'Name', with: 'Continental Jersey'
      fill_in 'Price', with: 50
      click_button 'Add Product'
      expect(page).to have_content 'Your product has been added'
      expect(current_path).to eq '/admin'
    end

    xscenario 'images can be added to the product' do
      visit '/admin'
      click_link 'Add New Product'
      fill_in 'Name', with: 'Continental Jersey'
      fill_in 'Price', with: 50

    end

  end

  context 'editing products' do

    scenario 'prompts the user to fill in a form' do
      visit '/admin'
      click_link 'Edit continental jersey'
      fill_in 'Name', with: 'new continental jersey'
      fill_in 'Price', with: 60
      click_button 'Update Product'
      expect(page).to have_content 'new continental jersey'
    end

  end

  context 'deleting a product' do

    scenario 'removes a product' do
      visit '/admin'
      click_link 'Delete continental jersey'
      expect(page).not_to have_content 'continental jersey'
      expect(page).to have_content 'Product has been deleted'
    end

  end

end
