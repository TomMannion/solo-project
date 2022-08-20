class Restaurant

  def initialize(name)
    @name = name
    @menu_items = []
  end

  def name
    @name
  end

  def menu_items
    @menu_items
  end

  def add_menu_item(menu_item)
    @menu_items << menu_item
  end

end