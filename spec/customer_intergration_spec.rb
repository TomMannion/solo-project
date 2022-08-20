require 'customer'
require 'restaurant'
require 'menu_item'
require 'order_formatting'

RSpec.describe "Customer intergration" do
  it "should be able to add an order item" do
    customer = Customer.new("Customer")
    pizza = MenuItem.new("Pizza", "10.00")
    customer.add_to_order(pizza, 2)
    expect(customer.order).to eq([pizza, pizza])
  end

  it "should be able to remove an order item" do
    customer = Customer.new("Customer")
    pizza = MenuItem.new("Pizza", "10.00")
    customer.add_to_order(pizza, 2)
    customer.remove_from_order(pizza)
    expect(customer.order).to eq([])
  end

  it "should be able to check the total price of the order" do
    customer = Customer.new("Customer")
    pizza = MenuItem.new("Pizza", "10.25")
    customer.add_to_order(pizza, 2)
    expect(customer.total_order_price).to eq(20.50)
  end

  it "should be able to print the order" do
    io = double :io
    customer = Customer.new("Customer")
    pizza = MenuItem.new("Pizza", "10.25")
    customer.add_to_order(pizza, 1)
    customer_order = OrderFormatting.new(customer.order, io)
    expect(io).to receive(:puts).with("Pizza - 10.25")
    customer_order.print_order
  end

end