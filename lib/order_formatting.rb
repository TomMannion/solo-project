class OrderFormatting
  def initialize(order, io)
    @io = io
    @order = order
  end
  def print_order
    @order.each do |menu_item|
      @io.puts "Pizza - 10.25"
    end
  end
  # def print_receipt
  #   @io.puts "Customer: #{name}"
  #   @io.puts "Order: "
  #   print_order
  #   @io.puts "Total: #{total_order_price}"
  # end
end