require 'rails_helper'

feature 'Footer Menu' do

  scenario 'it exists' do
    visit '/'
    expect(page).to have_css('footer')
  end

  scenario 'has links to necessary pages' do
    visit '/'
    expect(page).to have_link('Mailing List')
    expect(page).to have_link('The Brand')
    expect(page).to have_link('Contact Us')
  end

  context 'Routing works to other pages' do

    scenario 'The Brand' do
      visit '/'
      click_link 'The Brand'
      expect(current_path).to eq(brand_index_path)
    end

    scenario 'Contact Us' do
      visit '/'
      click_link 'Contact Us'
      expect(current_path).to eq(contact_index_path)
    end

  end

end
