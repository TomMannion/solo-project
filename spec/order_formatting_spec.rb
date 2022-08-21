require 'order_formatting'

RSpec.describe OrderFormatting do
  it "should be able to print the order" do
    io = double :io
    customer = double :fake_customer, order: [double(:fake_menu_item, name: "Pizza", price: "10.25")]
    customer_order = OrderFormatting.new(customer, io)
    expect(io).to receive(:puts).with("Pizza - 10.25")
    customer_order.print_order
  end
  it "should be able to print the receipt" do
    io = double :io
    customer = double :fake_customer, name: "Customer", total_order_price: "10.25", order: [double(:fake_menu_item, name: "Pizza", price: "10.25")]
    customer_order = OrderFormatting.new(customer, io)
    expect(io).to receive(:puts).with("Customer: Customer").ordered
    expect(io).to receive(:puts).with("Order: ").ordered
    expect(io).to receive(:puts).with("Pizza - 10.25").ordered
    expect(io).to receive(:puts).with("Total: 10.25").ordered
    customer_order.print_receipt
  end
end