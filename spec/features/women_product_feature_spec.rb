require 'rails_helper'

feature 'Product page' do

  before(:each) do

    @male = Gender.create(sex: 'male')
    @female = Gender.create(sex: 'female')

    @small = Size.create(size: 'small')
    @medium = Size.create(size: 'medium')

    @jerseys = Category.create(category: 'jerseys')
    @shirts = Category.create(category: 'shirts')
    @bottoms = Category.create(category: 'bottoms')
    @accessories = Category.create(category: 'accessories')
    @jackets = Category.create(category: 'jackets')
    @baselayers = Category.create(category: 'baselayers')

    @lads_jersey = Product.create(name: 'Mens Jersey', price: 50, category_id: (@jerseys.id))
    @ladies_jersey = Product.create(name: 'Womens Jersey', price: 50, category_id: (@jerseys.id))
    @ladies_shirt = Product.create(name: 'Womens Shirt', price: 60, category_id: (@shirts.id))
    @ladies_bottoms = Product.create(name: 'Womens Bottoms', price: 70, category_id: (@bottoms.id))
    @ladies_jacket = Product.create(name: 'Womens Jacket', price: 70, category_id: (@jackets.id))
    @ladies_accessories = Product.create(name: 'Womens Accessories', price: 70, category_id: (@accessories.id))
    @ladies_baselayers = Product.create(name: 'Womens Baselayers', price: 70, category_id: (@baselayers.id))

    Inventory.create(product_id: (@lads_jersey.id),
                    gender_id: (@male.id),
                    size_id: (@small.id),
                    sku: 'ABC-123-123')
    Inventory.create(product_id: (@ladies_jersey.id),
                    gender_id: (@female.id),
                    size_id: (@small.id),
                    sku: 'DEF-123-123')
    Inventory.create(product_id: (@ladies_shirt.id),
                    gender_id: (@female.id),
                    size_id: (@small.id),
                    sku: 'GHI-123-123')
    Inventory.create(product_id: (@ladies_bottoms.id),
                    gender_id: (@female.id),
                    size_id: (@medium.id),
                    sku: 'JKL-123-123')
    Inventory.create(product_id: (@ladies_jacket.id),
                    gender_id: (@female.id),
                    size_id: (@medium.id),
                    sku: 'MNO-123-123')
    Inventory.create(product_id: (@ladies_accessories.id),
                    gender_id: (@female.id),
                    size_id: (@medium.id),
                    sku: 'PQR-123-123')
    Inventory.create(product_id: (@ladies_baselayers.id),
                    gender_id: (@female.id),
                    size_id: (@medium.id),
                    sku: 'STU-123-123')
  end

  context 'womens product home page' do

    scenario 'exists' do
      visit '/women'
      expect(page).to have_content('Womens Bottom')
      expect(page).not_to have_content('Mens Jersey')
    end

    scenario "displays Women under the logo" do
      visit '/women'
      expect(find('.page-name')).to have_content('Women')
    end

    scenario 'displays all the jerseys' do
      visit '/women'
      expect(find('#womens-jerseys')).to have_content('Womens Jersey')
      expect(find('#womens-jerseys')).not_to have_content('Mens Jersey')
    end

    scenario 'displays all the shirts' do
      visit '/women'
      expect(find('#womens-shirts')).to have_content('Ladies Shirt')
      expect(find('#womens-shirts')).not_to have_content('Lads Jersey')
    end

    scenario 'displays all the bottoms' do
      visit '/women'
      expect(find('#womens-bottoms')).to have_content('Ladies Bottoms')
      expect(find('#womens-bottoms')).not_to have_content('Ladies Top')
    end

  end

  context "front product category page - women's jerseys" do

    scenario 'exists' do
      visit '/women/jerseys'
      expect(page).to have_content('Ladies Jersey')
    end

    scenario 'displays the gender and the category under the logo' do
      visit '/women/jerseys'
      expect(find('.page-name')).to have_content('Women | Jerseys')
    end

    scenario 'shows the prices' do
      visit '/women/jerseys'
      expect(page).to have_content('£50')
    end

    xscenario 'displays product images' do
      visit '/women/jerseys'
      expect(page).to have_css(".product-image")
    end

    scenario "displays only the women's jerseys" do
      visit '/women/jerseys'
      expect(page).to have_content("Ladies Jersey")
      expect(page).not_to have_content("Lads Jersey")
      expect(page).not_to have_content("Ladies Top")
    end

  end

  context "front product category page - women's shirts" do

    scenario "displays only the women's shirts" do
      visit '/women/shirts'
      expect(page).to have_content("Ladies Shirt")
      expect(page).not_to have_content("Ladies Jersey")
      expect(page).not_to have_content("Ladies Bottoms")
    end

  end

  context "front product category page - women's bottoms" do

    scenario "displays ony the women's bottoms" do
      visit '/women/bottoms'
      expect(page).to have_content("Ladies Bottoms")
      expect(page).not_to have_content("Ladies Jersey")
      expect(page).not_to have_content("Ladies Top")
    end

  end

  context "front product category page - womens jackets" do

    scenario "displays only the women's jackets" do
      visit '/women/jackets'
      expect(page).to have_content("Ladies Jacket")
      expect(page).not_to have_content("Ladies Jerseys")
      expect(page).not_to have_content("Ladies Top")
    end

  end

  context "front product category page - womens baselayers" do

    scenario "displays only the women's baselayers" do
      visit '/women/baselayers'
      expect(page).to have_content("Ladies Baselayers")
      expect(page).not_to have_content("Ladies Jerseys")
      expect(page).not_to have_content("Ladies Top")
    end

  end

  context "front product category page - womens accessories" do

    scenario "displays only the women's accessories" do
      visit '/women/accessories'
      expect(page).to have_content("Women | Accessories")
      expect(page).not_to have_content("Women | Jerseys")
      expect(page).not_to have_content("Women | Tops")
    end

  end

  context "individual product page - Women Jersey" do

    scenario "displays the correct product" do
      visit '/women/jerseys'
      click_link('Ladies Jersey')
      expect(page).to have_content("Ladies Jersey")
    end

    scenario 'displays the gender, category and name of the item under the logo' do
      visit '/women/jerseys'
      click_link('Ladies Jersey')
      expect(find('.page-name')).to have_content('Women | Jerseys | Ladies Jersey')
    end

  end

  context "individual product page - Women Shirts" do

    scenario "displays the correct product" do
      visit '/women/shirts'
      expect(page).to have_content("Women | Shirts")
    end

  end

  context "individual product page - Women Bottoms" do

    scenario "displays the correct products" do
      visit '/women/bottoms'
      expect(page).to have_content("Women | Bottoms")
    end

  end

  context "individual product page - Women Jackets" do

    scenario "displays the correct product" do
      visit '/women/jackets'
      expect(page).to have_content("Women | Jackets")
    end

  end

  context "individual product page - Women Baselayers" do

    scenario "displays the correct product" do
      visit '/women/baselayers'
      expect(page).to have_content("Women | Baselayers")
    end

  end

  context "individual product page - Women Accessories" do

    scenario "displays the correct product" do
      visit '/women/accessories'
      expect(page).to have_content("Women | Accessories")
    end

  end

end
