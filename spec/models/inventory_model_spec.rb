require 'rails_helper'

RSpec.describe Inventory, :type => :model do

  before(:each) do
    @inventory = Inventory.create(product_id: 1, gender_id: 1, size_id: 1,
                                  sku: '123-123-123', quantity: 20)
  end

  it 'can be created' do
    expect(Inventory.count).to eq 1
  end

  it 'has an SKU' do
    expect(@inventory.sku).to eq('123-123-123')
  end

  it 'holds quantity' do
    expect(@inventory.quantity).to eq(20)
  end

  it "is not valid unless it has a unique SKU number" do
    Inventory.create(sku: 'CJMM01')
    inventory = Inventory.new(sku: "CJMM01")
    expect(inventory.valid?).to eq(false)
  end

end
