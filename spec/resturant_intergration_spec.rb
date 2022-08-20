require 'restaurant'
#require 'menu_item'

RSpec.describe "Resturant intergration" do
  it "should add a menu item" do
    restaurant = Restaurant.new("Restaurant")
    #pizza = MenuItem.new("Pizza", "10.00")
    #restaurant.add_menu_item(MenuItem.new(pizza))
    #expect(restaurant.menu_items).to eq([pizza])
  end

end