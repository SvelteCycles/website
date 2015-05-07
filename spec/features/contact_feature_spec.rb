require 'rails_helper'

feature 'Contact Form' do

  scenario 'it exists' do
    visit '/contact'
    expect(page).to have_css('form')
  end

end
