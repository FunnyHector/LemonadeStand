# frozen_string_literal: true

require './lemonade_stand_game'
require './view'
require './inventory'
require './market'
require './climate'
require './population_counter'

class LemonadeStandMain
  attr_reader :view, :game

  def initialize
    @view = View.new
    @game = LemonadeStandGame.new
  end

  def run
    while game.active? do
      game.initialize_day

      view.prompt_new_day(game.day_counter, game.total_money)
      view.prompt_lemon_price(game.market_lemon_price)
      view.prompt_sugar_price(game.market_sugar_price)
      view.prompt_forecast(game.current_temperature)
      view.prompt_daily_population(game.daily_population)

      lemonade_price = view.retrieve_lemonade_price
      game.lemonade_price = lemonade_price

      number_of_lemons_to_buy = view.retrieve_number_of_lemons_to_buy
      game.buy_lemons(number_of_lemons_to_buy)

      number_of_sugar_to_buy = view.retrieve_number_of_sugar_to_buy
      game.buy_sugar(number_of_sugar_to_buy)

      maximum_quantity = game.maximum_quantity
      number_of_lemonade_to_make = view.retrieve_number_of_lemonade_to_make(maximum_quantity)
      game.make_lemonade(number_of_lemonade_to_make)

      sales = game.calculate_sales
      lemonade_sold = game.lemonade_sold
      view.prompt_sales(lemonade_price, lemonade_sold, sales)

      game.finalize_day(sales)
      view.prompt_end_of_the_day(game.total_money)
    end

    result = game.result
    view.prompt_game_end(result)
  end
end

LemonadeStandMain.new.run
