require 'rails_helper'

RSpec.describe Colour, type: :model do

  it "is not valid unless it has a unique name" do
    Colour.create(colour: "blue")
    colour = Colour.new(colour: "blue")
    expect(colour.valid?).to eq(false)
  end

end
