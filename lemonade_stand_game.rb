# frozen_string_literal: true

class LemonadeStandGame
  DEFAULT_STARTING_MONEY = 50
  GAME_STATUS_ACTIVE = "active"
  # should have other statuses like won or lost

  attr_reader :day_counter, :total_money
  attr_accessor :lemonade_price

  def initialize(starting_money = DEFAULT_STARTING_MONEY)
    @total_money = starting_money
    @game_condition = GAME_STATUS_ACTIVE
    @day_counter = 1
    @lemonade_price = 0

    @inventory = Inventory.new
    @market = Market.new
    @climate = Climate.new
    @population_counter = PopulationCounter.new
  end

  def active?
    @game_condition == GAME_STATUS_ACTIVE
  end

  def initialize_day
    @market.refresh_prices
    @climate.generate_temperature
    @population_counter.generate_population(@climate.temperature)
  end

  def lemonade_sold
    population = @population_counter.daily_population
    num_of_lemonades = @inventory.lemonades

    [population, num_of_lemonades].min
  end

  def calculate_sales
    lemonade_price * lemonade_sold
  end

  def finalize_day(sales)
    @total_money += sales
    @day_counter += 1
  end

  def result
    "RESULT!!!"
  end

  ############################
  #    Delegation methods    #
  ############################

  def market_lemon_price
    @market.lemon_price
  end

  def market_sugar_price
    @market.sugar_price
  end

  def maximum_quantity
    @inventory.maximum_quantity
  end

  def buy_lemons(number_of_lemons)
    @inventory.buy_lemons(number_of_lemons)
    @total_money -= market_lemon_price * number_of_lemons
  end

  def buy_sugar(number_of_sugar)
    @inventory.buy_sugar(number_of_sugar)
    @total_money -= market_sugar_price * number_of_sugar
  end

  def make_lemonade(quantity)
    @inventory.make_lemonade(quantity)
  end

  def current_temperature
    @climate.temperature
  end

  def daily_population
    @population_counter.daily_population
  end
end
