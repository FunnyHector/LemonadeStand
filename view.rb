# frozen_string_literal: true

class View
  def prompt_new_day(day_counter, money)
    text = "#   It is day #{day_counter} and you have $#{money}   #"
    hash_line = "#" * text.length

    puts hash_line
    puts text
    puts hash_line
  end

  def retrieve_number_of_lemons_to_buy
    puts "How many lemons would you like to purchase?"
    gets.chomp.to_i
  end

  def retrieve_number_of_sugar_to_buy
    puts "How much sugar would you like to purchase?"
    gets.chomp.to_i
  end

  def retrieve_number_of_lemonade_to_make(maximum_quantity)
    puts "You can make a maximum of #{maximum_quantity} cups. How many would you like to make?"
    gets.chomp.to_i
  end

  def retrieve_lemonade_price
    puts 'How much would you like to charge per lemonade?'
    gets.chomp.to_f.round(2)
  end

  def prompt_lemon_price(lemon_price)
    puts "Current market lemon price is $#{lemon_price}"
  end

  def prompt_sugar_price(sugar_price)
    puts "Current market sugar price is $#{sugar_price}"
  end

  def prompt_forecast(temperature)
    puts "Temperature for the day is: #{temperature}"
  end

  def prompt_daily_population(population)
    puts "#{population} people will pass by the lemonade stand today!"
  end

  def prompt_sales(lemonade_price, lemonade_sold, sales)
    puts "Price is $#{lemonade_price}"
    puts "You sold #{lemonade_sold} cups of lemonade"
    puts "You got $#{sales} selling lemonade"
  end

  def prompt_end_of_the_day(total_money)
    puts "You have $#{total_money} left"
  end

  def prompt_game_end(result)
    puts "Game is ended. Your result:"
    puts result
  end
end
