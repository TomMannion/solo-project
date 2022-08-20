require 'menu_item'

RSpec.describe MenuItem do
  it "should initialize with a name and price" do
    pizza = MenuItem.new("Pizza", "10.00")
    expect(pizza.name).to eq("Pizza")
    expect(pizza.price).to eq("10.00")
  end
end