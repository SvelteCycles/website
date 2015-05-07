require 'rails_helper'

RSpec.describe Product, :type => :model do

  before(:each) do
    @jersey = Product.create(name: 'Continental Jersey', price: 50, description: 'race fit')
  end

  it 'can be created' do
    expect(Product.count).to eq 1
  end

  it 'has a name' do
    expect(@jersey.name).to eq('Continental Jersey')
  end

  it 'has a price' do
    expect(@jersey.price).to eq(50)
  end

  it 'has a description' do
    expect(@jersey.description).to eq('race fit')
  end

end
