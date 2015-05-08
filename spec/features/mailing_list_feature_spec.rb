require 'rails_helper'

feature 'Mailing List Popup' do

  scenario "mailing input field exists" do
    visit '/'
    expect(page).to have_css('.mailing-list-input')
  end

  scenario "mailing button exists" do
    visit '/'
    expect(page).to have_css('.mailing-list-btn')
  end

  scenario "confirmation panel exists" do
    visit '/'
    expect(page).to have_css('.mailing-confirm')
  end

end

feature 'Hidden popups upon visiting' do

  scenario 'mailing input field is hidden' do
    visit '/'
    expect(page).to have_selector('.mailing-list-input', visible: false)
  end

  scenario 'mailing button is hidden' do
    visit '/'
    expect(page).to have_selector('.mailing-list-btn', visible: false)
  end

end
