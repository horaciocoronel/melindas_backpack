class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    basic_clothing_items
    # Ensure appropriate clothing is added to backpack depending on the weather
    if weather == 'rainy'
      rainy_weather_items
    elsif weather == 'cold'
      cold_weather_items
    end

    # Ensure gym shoes are added to backpack if it's a gym day
    # Gotta get to the gym on Mondays and Thursdays.
    if day_of_week == 'monday' || day_of_week == 'thursday'
      @items << 'gym shoes'
    end

    # Bring a packed lunch on all weekdays and snacks on the weekends
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else
      @items << 'snacks'
    end
  end

  def basic_clothing_items
    @items << 'pants'
    @items << 'shirt'
  end

  def cold_weather_items
    @items << 'jacket'
  end
  def rainy_weather_items
    @items << 'umbrella'
  end

  # Prints a summary packing list for Melinda's backpack
  def print_summary_of_packing_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
