require 'rails_helper'

feature 'Product page' do

  before(:each) do
    # male = create(:gender)
    @male = Gender.create(sex: 'male')
    @female = Gender.create(sex: 'female')

    # small = create(:size)
    @small = Size.create(size: 'small')
    @medium = Size.create(size: 'medium')

    # jerseys = create(:category)
    @jerseys = Category.create(category: 'jerseys')
    @jackets = Category.create(category: 'jackets')
    @shirts = Category.create(category: 'shirts')
    @bottoms = Category.create(category: 'bottoms')
    @accessories = Category.create(category: 'accessories')
    @baselayers = Category.create(category: 'baselayers')

    # continental_jersey = create(:product)
    @lads_jersey = Product.create(name: 'Lads Jersey', price: 50, category_id: (@jerseys.id))
    @lads_jacket = Product.create(name: 'Lads Jacket', price: 50, category_id: (@jackets.id))
    @lads_accessory = Product.create(name: 'Lads Accessory', price: 50, category_id: (@accessories.id))
    @lads_shirt = Product.create(name: 'Lads Shirt', price: 60, category_id: (@shirts.id))
    @lads_bottoms = Product.create(name: 'Lads Bottoms', price: 70, category_id: (@bottoms.id))
    @lads_baselayer = Product.create(name: 'Lads Baselayer', price: 70, category_id: (@baselayers.id))
    @ladies_jersey = Product.create(name: 'Ladies Jersey', price: 50, category_id: (@jerseys.id))

    # jersey_inventory = create(:inventory)
    Inventory.create(product_id: (@lads_jersey.id),
                    gender_id: (@male.id),
                    size_id: (@small.id),
                    sku: 'ABC-123-123')
    Inventory.create(product_id: (@lads_jacket.id),
                    gender_id: (@male.id),
                    size_id: (@small.id),
                    sku: 'DEF-123-123')
    Inventory.create(product_id: (@lads_accessory.id),
                    gender_id: (@male.id),
                    size_id: (@small.id),
                    sku: 'GHI-123-123')
    Inventory.create(product_id: (@lads_shirt.id),
                    gender_id: (@male.id),
                    size_id: (@small.id),
                    sku: 'JKL-123-123')
    Inventory.create(product_id: (@lads_bottoms.id),
                    gender_id: (@male.id),
                    size_id: (@medium.id),
                    sku: 'MNO-123-123')
    Inventory.create(product_id: (@lads_baselayer.id),
                    gender_id: (@male.id),
                    size_id: (@medium.id),
                    sku: 'PQR-123-123')
    Inventory.create(product_id: (@ladies_jersey.id),
                    gender_id: (@female.id),
                    size_id: (@small.id),
                    sku: 'STU-123-123')

  end

  context 'mens product home page' do

    xscenario 'exists' do
      visit '/men'
      save_and_open_page
      expect(page).to have_content('Lads Jersey')
    end

    scenario "displays Men under the logo" do
      visit '/men'
      expect(find('.page-name')).to have_content('Men')
    end

    xscenario 'displays jerseys' do
      visit '/men'
      expect(find('#mens-jerseys')).to have_content('Lads Jersey')
    end

    scenario 'displays shirts' do
      visit '/men'
      expect(find('#mens-shirts')).to have_content('Lads Shirt')
    end

    scenario 'displays bottoms' do
      visit '/men'
      expect(find('#mens-bottoms')).to have_content('Lads Bottoms')
    end

  end

  context "front product category page - men's jerseys" do

    scenario 'displays the correct product' do
      visit '/men/jerseys'
      expect(page).to have_content('Lads Jersey')
    end

    scenario 'displays the Gender and Category under the logo' do
      visit '/men/jerseys'
      expect(find('.page-name')).to have_content('Men | Jerseys')
    end

    scenario 'shows prices' do
      visit '/men/jerseys'
      expect(page).to have_content('£50')
    end

    xscenario 'displays images' do
      visit '/men/jerseys'
      expect(page).to have_css(".product-image")
    end

    scenario "displays only the men's jerseys" do
      visit '/men/jerseys'
      expect(page).to have_content("Lads Jersey")
      expect(page).not_to have_content("Ladies Jersey")
      expect(page).not_to have_content("Lads Top")
    end

  end

  context "front product category page - men's jackets" do

    scenario "displays only the men's jackets" do
      visit '/men/jackets'
      expect(page).to have_content("Lads Jacket")
      expect(page).not_to have_content("Lads Jersey")
      expect(page).not_to have_content("Lads Bottoms")
    end

  end

  context "front product category page - men's shirts" do

    scenario "displays only the men's shirts" do
      visit '/men/shirts'
      expect(page).to have_content("Lads Shirt")
      expect(page).not_to have_content("Lads Jersey")
      expect(page).not_to have_content("Lads Bottoms")
    end

  end

  context "front product category page - men's bottoms" do

    scenario "displays only the men's bottoms" do
      visit '/men/bottoms'
      expect(page).to have_content("Lads Bottoms")
      expect(page).not_to have_content("Lads Top")
      expect(page).not_to have_content("Lads Jersey")
    end

  end

  context "front product category page - men's accessories" do

    scenario "displays only the men's accessories" do
      visit '/men/accessories'
      expect(page).to have_content("Lads Accessory")
      expect(page).not_to have_content("Lads Top")
      expect(page).not_to have_content("Lads Jersey")
    end

  end

  context "front product category page - men's baselayers" do

    scenario "displays only the men's baselayers" do
      visit '/men/baselayers'
      expect(page).to have_content("Lads Baselayer")
      expect(page).not_to have_content("Lads Top")
      expect(page).not_to have_content("Lads Jersey")
    end

  end

  context 'individual product page - Men Jersey' do

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/men/jerseys'
      click_link('Lads Jersey')
      expect(find('.page-name')).to have_content('Men | Jerseys | Lads Jersey')
    end

  end

  context 'individual product page - Men Jacket' do

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/men/jackets'
      click_link('Lads Jacket')
      expect(find('.page-name')).to have_content('Men | Jackets | Lads Jacket')
    end

  end

  context "individual product page - Men's Shirt" do

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/men/shirts'
      click_link('Lads Shirt')
      expect(find('.page-name')).to have_content('Men | Shirts | Lads Shirt')
    end

  end

  context "individual product page - Men's Bottoms" do

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/men/bottoms'
      click_link('Lads Bottoms')
      expect(find('.page-name')).to have_content('Men | Bottoms | Lads Bottoms')
    end

  end

  context "individual product page - Men's Accessories" do

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/men/accessories'
      click_link('Lads Accessory')
      expect(find('.page-name')).to have_content('Men | Accessories | Lads Accessory')
    end

  end

  context "individual product page - Men's Baselayers" do

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/men/baselayers'
      click_link('Lads Baselayer')
      expect(find('.page-name')).to have_content('Men | Baselayers | Lads Baselayer')
    end

  end

end
