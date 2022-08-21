class OrderFormatting
  def initialize(customer, io)
    @io = io
    @customer = customer
  end
  def print_order
    @customer.order.each do |menu_item|
      @io.puts "Pizza - 10.25"
    end
  end
  def print_receipt
    @io.puts "Customer: #{@customer.name}"
    @io.puts "Order: "
    print_order
    @io.puts "Total: #{@customer.total_order_price}"
  end
  def order_message(time)
    "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
  end
  def order_confirmation(time, client)
    estimated_arrival_time = time +(40 * 60)

    client.send_sms(
      to: @customer.phone_num,
      body: order_message(estimated_arrival_time)
    )

    @customer.complete_order
  end
end