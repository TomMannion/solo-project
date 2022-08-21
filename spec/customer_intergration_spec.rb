require 'customer'
require 'restaurant'
require 'menu_item'
require 'order_formatting'
require 'twilio_adapter'

RSpec.describe "Customer intergration" do
  it "should be able to add an order item" do
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.00")
    customer.add_to_order(pizza, 2)
    expect(customer.order).to eq([pizza, pizza])
  end

  it "should be able to remove an order item" do
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.00")
    customer.add_to_order(pizza, 2)
    customer.remove_from_order(pizza)
    expect(customer.order).to eq([pizza])
  end

  it "should be able to check the total price of the order" do
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.25")
    customer.add_to_order(pizza, 2)
    expect(customer.total_order_price).to eq(20.50)
  end

  it "should be able to print the order" do
    io = double :io
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.25")
    customer.add_to_order(pizza, 1)
    customer_order = OrderFormatting.new(customer, io)
    expect(io).to receive(:puts).with("Pizza - 10.25")
    customer_order.print_order
  end

  it "should be able to print the receipt" do
    io = double :io
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.25")
    customer.add_to_order(pizza, 2)
    customer_order = OrderFormatting.new(customer, io)
    expect(io).to receive(:puts).with("Customer: Customer")
    expect(io).to receive(:puts).with("Order: ")
    expect(io).to receive(:puts).with("Pizza - 10.25")
    expect(io).to receive(:puts).with("Pizza - 10.25")
    expect(io).to receive(:puts).with("Total: 20.5")
    customer_order.print_receipt
  end

  it "should be able to complete the order" do
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.25")
    customer.add_to_order(pizza, 2)
    customer.complete_order
    expect(customer.order).to eq([])
  end

  it "should be able to send a text message" do
    
    client = TwilioAdapter.new(double :client)
    customer = Customer.new("Customer", "1234567890")
    pizza = MenuItem.new("Pizza", "10.25")
    time = Time.new(2022, 8, 21, 12, 0, 0)
    customer.add_to_order(pizza, 2)
    customer_order = OrderFormatting.new(customer, client)

    expect(client).to receive(:send_sms)
      .with(hash_including(:body, :to))

    customer_order.order_confirmation(time, client)
  end

end