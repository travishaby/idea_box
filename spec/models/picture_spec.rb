require 'rails_helper'

RSpec.describe Picture, type: :model do
  it "has a name and a description" do
    picture = Picture.new(name: "picture", url: "www.picture.com")

    expect(picture).to be_valid
  end

  it "must have a description" do
    picture = Picture.new(name: "picture")

    expect(picture).to_not be_valid
  end

  it "must have a name" do
    picture = Picture.new(url: "www.picture.com")

    expect(picture).to_not be_valid
  end

  it "has a unique name and url" do
    Picture.create(name: "picture", url: "www.picture.com")
    picture1 = Picture.new(name: "picture", url: "www.picture1.com")
    picture2 = Picture.new(name: "picture2", url: "www.picture.com")

    expect(picture1).to_not be_valid
    expect(picture2).to_not be_valid
  end
end
