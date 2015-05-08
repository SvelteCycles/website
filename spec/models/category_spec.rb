require 'rails_helper'

RSpec.describe Category, type: :model do

  it "is not valid unless it has a unique name" do
    Category.create(category: "jerseys")
    category = Category.new(category: "jerseys")
    expect(category.valid?).to eq(false)
  end

end
