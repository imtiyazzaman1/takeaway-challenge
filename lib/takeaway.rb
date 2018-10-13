require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway
  MENU = {
    "Quarter Chicken" => 4,
    "Half Chicken" => 8,
    "Whole Chicken" => 13,
    "Chicken Wing" => 1
  }

  def initialize(menu: Menu.new, order: Order.new, txt_message: Message.new)
    @menu = menu
    @order = order
    @txt_message = txt_message
  end

  def menu
    @menu.show_menu
  end

  def add_to_order(dish, quantity)
    @order.add(dish, quantity)
  end

  def current_order
    @order.current
  end

  def check_total
    "£#{@order.total}"
  end

  def place_order(amount)
    raise("Incorrect total provided") unless amount == @order.total
    @txt_message.send
    "Order placed. You will receive a confirmation text message shortly"
  end
end
