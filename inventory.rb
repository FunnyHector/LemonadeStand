# frozen_string_literal: true

class Inventory
  attr_reader :lemonades

  def initialize
    @sugar = 0
    @lemons = 0
    @lemonades = 0
  end

  def maximum_quantity
    [@sugar, @lemons].min
  end

  def make_lemonade(quantity)
    @lemonades += quantity
  end

  def buy_lemons(number_of_lemons)
    @lemons += number_of_lemons
  end

  def buy_sugar(number_of_sugar)
    @sugar += number_of_sugar
  end
end
