require 'restaurant'

RSpec.describe Restaurant do
  it "should initialize with a name" do
    restaurant = Restaurant.new("Restaurant")
    expect(restaurant.name).to eq("Restaurant")
  end
  it "should initialize with an empty menu" do
    restaurant = Restaurant.new("Restaurant")
    expect(restaurant.menu_items).to eq([])
  end
end