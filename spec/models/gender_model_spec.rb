require 'rails_helper'

RSpec.describe Gender, :type => :model do

  before(:each) do
    @male = Gender.create(sex: 'male')
    @female = Gender.create(sex: 'female')
  end

  it 'can be created' do
    expect(Gender.count).to eq 2
  end

  it 'has a male attribute' do
    expect(@male.sex).to eq('male')
  end

  it 'has a female attribute' do
    expect(@female.sex).to eq('female')
  end

  it "is not valid unless it has a unique sex" do
    Gender.create(sex: "male")
    gender = Gender.new(sex: "male")
    expect(gender.valid?).to eq(false)
  end

end
