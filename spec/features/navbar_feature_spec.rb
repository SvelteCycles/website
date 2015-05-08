require 'rails_helper'

feature 'Navbar' do

  before(:each) do
    @male = Gender.create(sex: 'male')
    @female = Gender.create(sex: 'female')

    @small = Size.create(size: 'small')
    @medium = Size.create(size: 'medium')

    @jerseys = Category.create(category: 'jerseys')
    @jackets = Category.create(category: 'jackets')
    @shirts = Category.create(category: 'shirts')
    @bottoms = Category.create(category: 'bottoms')
    @accessories = Category.create(category: 'accessories')
    @baselayers = Category.create(category: 'baselayers')

    @lads_jersey = Product.create(name: 'Lads Jersey', price: 50, category_id: (@jerseys.id))
    @lads_jacket = Product.create(name: 'Lads Jacket', price: 50, category_id: (@jackets.id))
    @lads_accessory = Product.create(name: 'Lads Accessory', price: 50, category_id: (@accessories.id))
    @lads_shirt = Product.create(name: 'Lads Shirt', price: 60, category_id: (@shirts.id))
    @lads_bottoms = Product.create(name: 'Lads Bottoms', price: 70, category_id: (@bottoms.id))
    @lads_baselayer = Product.create(name: 'Lads Baselayer', price: 70, category_id: (@baselayers.id))
    @ladies_jersey = Product.create(name: 'Ladies Jersey', price: 50, category_id: (@jerseys.id))

    Inventory.create(product_id: (@lads_jersey.id),
                    gender_id: (@male.id),
                    size_id: (@small.id))
    Inventory.create(product_id: (@lads_jacket.id),
                    gender_id: (@male.id),
                    size_id: (@small.id))
    Inventory.create(product_id: (@lads_accessory.id),
                    gender_id: (@male.id),
                    size_id: (@small.id))
    Inventory.create(product_id: (@lads_shirt.id),
                    gender_id: (@male.id),
                    size_id: (@small.id))
    Inventory.create(product_id: (@lads_bottoms.id),
                    gender_id: (@male.id),
                    size_id: (@medium.id))
    Inventory.create(product_id: (@lads_baselayer.id),
                    gender_id: (@male.id),
                    size_id: (@medium.id))
    Inventory.create(product_id: (@ladies_jersey.id),
                    gender_id: (@female.id),
                    size_id: (@small.id))

  end

  scenario 'exists' do
    visit '/'
    expect(page).to have_css('nav')
  end

  scenario 'has links to necessary pages' do
    visit '/'
    expect(page).to have_link('Men')
    expect(page).to have_link('Women')
    expect(page).to have_link('Video')
    expect(page).to have_link('Events')
  end

  context 'Routing working to other pages' do

    scenario 'Mens' do
      visit '/'
      click_link 'Men'
      expect(current_path).to eq(men_path)
    end

    scenario 'Womens' do
      visit '/'
      click_link 'Women'
      expect(current_path).to eq(women_path)
    end

    scenario 'Video' do
      visit '/'
      click_link 'Video'
      expect(current_path).to eq(video_index_path)
    end

    scenario 'Events' do
      visit '/'
      click_link 'Events'
      expect(current_path).to eq(events_path)
    end

  end

  context 'Sub-menus' do
    scenario "Men's jerseys" do
      visit '/'
      first('#mens-submenu').click_link('Jerseys')
      expect(current_path).to eq(jerseys_path)
    end

    scenario "Men's jackets" do
      visit '/'
      first('#mens-submenu').click_link('Jackets')
      expect(current_path).to eq(jackets_path)
    end

    scenario "Men's shirts" do
      visit '/'
      first('#mens-submenu').click_link('Shirts')
      expect(current_path).to eq(shirts_path)
    end

    scenario "Men's trousers" do
      visit '/'
      first('#mens-submenu').click_link('Bottoms')
      expect(current_path).to eq(bottoms_path)
    end

    scenario "Men's accessories" do
      visit '/'
      first('#mens-submenu').click_link('Accessories')
      expect(current_path).to eq(accessories_path)
    end

    scenario "Men's baselayers" do
      visit '/'
      first('#mens-submenu').click_link('Baselayers')
      expect(current_path).to eq(baselayers_path)
    end

    xscenario "Women's jerseys" do
      visit '/'
      first('#womens-submenu').click_link('Jerseys')
      expect(current_path).to eq('/women/jerseys')
    end

    scenario "Women's jacketss" do
      visit '/'
      first('#womens-submenu').click_link('Jackets')
      expect(current_path).to eq('/women/jackets')
    end

    scenario "Women's shirts" do
      visit '/'
      first('#womens-submenu').click_link('Shirts')
      expect(current_path).to eq('/women/shirts')
    end

    scenario "Women's trousers" do
      visit '/'
      first('#womens-submenu').click_link('Bottoms')
      expect(current_path).to eq('/women/bottoms')
    end

    scenario "Women's accessories" do
      visit '/'
      first('#womens-submenu').click_link('Accessories')
      expect(current_path).to eq('/women/accessories')
    end

    scenario "Women's baselayers" do
      visit '/'
      first('#womens-submenu').click_link('Baselayers')
      expect(current_path).to eq('/women/baselayers')
    end

  end

end
