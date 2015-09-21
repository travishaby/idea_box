require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a username and a password" do
    user = User.new(username: "travis", password: "password")

    expect(user).to be_valid
  end

  it "must have a username" do
    user = User.new(password: "password")

    expect(user).to_not be_valid
  end

  it "must have a password" do
    user = User.new(username: "travis")

    expect(user).to_not be_valid
  end

  it "must be a unique username" do
    user = User.create(username: "travis", password: "password")
    user2 = User.new(username: "travis", password: "password")

    expect(user2).to_not be_valid
  end

end
