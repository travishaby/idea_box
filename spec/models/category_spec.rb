require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a name and a description" do
    category = Category.new(name: "Fancy Cheeses")

    expect(category).to be_valid
  end

  it "must have a description" do
    category = Category.new

    expect(category).to_not be_valid
  end
end
