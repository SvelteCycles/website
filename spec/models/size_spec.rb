require 'rails_helper'

RSpec.describe Size, type: :model do

  it "is not valid unless it has a unique name" do
    Size.create(size: "small")
    size = Size.new(size: "small")
    expect(size.valid?).to eq(false)
  end

end
