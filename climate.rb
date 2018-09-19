# frozen_string_literal: true

class Climate
  attr_reader :random_generator, :temperature

  def initialize
    @random_generator = Random.new
    @temperature = random_generator.rand(35)
  end

  def generate_temperature
    new_temperature = @temperature.to_f * random_multiplier
    @temperature = new_temperature.to_i
  end

  private

  def random_multiplier
    random_generator.rand(0.5..1.5)
  end
end
