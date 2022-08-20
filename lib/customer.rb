class Customer

  def initialize(name)
    @name = name
    @order = []
  end
  def name
    @name
  end
  def order
    @order
  end
  def add_to_order(menu_item, quantity)
    quantity.times do
      @order << menu_item
    end
  end
  def remove_from_order(menu_item)
    @order.delete(menu_item)
  end
  def total_order_price
    @order.reduce(0) { |sum, menu_item| sum + menu_item.price.to_f }
  end
  # def remove_from_order(menu_item)
  #   @order.delete(menu_item)
  # end
  # def total_order_price
  #   @order.reduce(0) { |sum, menu_item| sum + menu_item.price }
  # end
  # def print_order
  #   @order.each do |menu_item|
  #     puts "#{menu_item.name} - #{menu_item.price}"
  #   end
  # end
  # def print_receipt
  #   puts "Customer: #{name}"
  #   puts "Order: "
  #   print_order
  #   puts "Total: #{total_order_price}"
  # end

end