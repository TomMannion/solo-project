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
  it "should be able to add a menu item" do
    restaurant = Restaurant.new("Restaurant")
    pizza = double :fake_item
    restaurant.add_menu_item(pizza)
    expect(restaurant.menu_items).to eq([pizza])
  end
end