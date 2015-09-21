require 'rails_helper'

RSpec.describe Idea, type: :model do

  it "has a name and a description" do
    idea = Idea.new(name: "travis", description: "is my name")

    expect(idea).to be_valid
  end

  it "must have a description" do
    idea = Idea.new(name: "travis")

    expect(idea).to_not be_valid
  end

  it "must have a name" do
    idea = Idea.new(description: "is my name")

    expect(idea).to_not be_valid
  end

end
