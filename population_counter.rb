# frozen_string_literal: true

class PopulationCounter
  BASE_POPULATION = 200
  MIN_POPULATION = 20

  attr_reader :daily_population

  def generate_population(temperature)
    temperature_multiplier = temperature / 10
    @daily_population = BASE_POPULATION * temperature_multiplier
    @daily_population = MIN_POPULATION if @daily_population < 20

    @daily_population
  end
end
