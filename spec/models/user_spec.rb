require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is invalid without first name" do
    user = User.new(last_name: Faker::Pokemon.name, email: "Faker::Pokemon@mail.com")
    expect(user).to be_invalid
  end 
  it "is invalid without last name" do
    user = User.new(first_name: Faker::Pokemon.name, email: Faker::Pokemon.name + "@mail.com")
    expect(user).to be_invalid
  end
  it "is invalid without email" do
    user = User.new(first_name: Faker::Pokemon.name, last_name: Faker::Pokemon.name)
    expect(user).to be_invalid
  end
  it "is invalid without unique email" do
    user = User.new(first_name: Faker::Pokemon.name, last_name: Faker::Pokemon.name, email: "hello@gmail.com")
    user2 = User.new(first_name: Faker::Pokemon.name, last_name: Faker::Pokemon.name, email: "hello@gmail.com")
    expect(user2).to be_invalid
  end
end
