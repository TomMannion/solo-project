require 'order_formatting'

RSpec.describe OrderFormatting do
  it "should be able to print the order" do
    io = double :io
    customer = double :fake_customer, order: [double(:fake_menu_item, name: "Pizza", price: "10.25")]
    customer_order = OrderFormatting.new(customer.order, io)
    expect(io).to receive(:puts).with("Pizza - 10.25")
    customer_order.print_order
  end
end