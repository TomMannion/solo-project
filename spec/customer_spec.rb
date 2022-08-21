require 'customer'

RSpec.describe Customer do
  it "should initialize with a name and phone" do
    customer = Customer.new("Customer", "1234567890")
    expect(customer.name).to eq("Customer")
    expect(customer.phone_num).to eq("1234567890")
  end

  it "should initialize with an empty order" do
    customer = Customer.new("Customer", "1234567890")
    expect(customer.order).to eq([])
  end

  it "should be able to add an order item" do
    customer = Customer.new("Customer", "1234567890")
    pizza = double :fake_item
    customer.add_to_order(pizza, 2)
    expect(customer.order).to eq([pizza, pizza])
  end

  it "should be able to check the total price of the order" do
    customer = Customer.new("Customer", "1234567890")
    pizza = double :fake_item, price: "10.25"
    customer.add_to_order(pizza, 2)
    expect(customer.total_order_price).to eq(20.50)
  end

  it "should be able to remove an order item" do
    customer = Customer.new("Customer", "1234567890")
    pizza = double :fake_item, name: "Pizza", price: "10.25"
    customer.add_to_order(pizza, 2)
    customer.remove_from_order(pizza)
    expect(customer.order).to eq([pizza])
  end

  it "should complete the order" do
    customer = Customer.new("Customer", "1234567890")
    pizza = double :fake_item, name: "Pizza", price: "10.25"
    customer.add_to_order(pizza, 2)
    customer.complete_order
    expect(customer.order).to eq([])
  end

end