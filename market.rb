# frozen_string_literal: true

class Market
  attr_reader :lemon_price, :sugar_price

  def initialize
    @random_generator = Random.new
  end

  def refresh_prices
    generate_lemon_price
    generate_sugar_price
  end

  private

  def generate_lemon_price
    @lemon_price = @random_generator.rand(3..5)
  end

  def generate_sugar_price
    @sugar_price = @random_generator.rand(1..3)
  end
end
