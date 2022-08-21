class Customer

  def initialize(name, phone)
    @name = name
    @phone_num = phone
    @order = []
  end
  def name
    @name
  end
  def phone_num
    @phone_num
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
  def remove_from_order(menu_item)
    @order.delete_at(@order.index(menu_item))
  end
  def complete_order
    @order = []
  end

end