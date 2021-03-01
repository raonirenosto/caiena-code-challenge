class ApplicationController < ActionController::API
  def format_weather_text current_weather, 
      next_days_weather, city, today
    
    return today_message(current_weather, city, today) +
      next_days(next_days_weather)
  end

  def today_message current_weather, city, date
    temp = current_weather[:temperature].floor(0)
    city_name = city.split(",")[0].titleize
    weather = current_weather[:weather]
    day_month = "#{date.day}/#{date.month}"
    return  "#{temp}°C e #{weather} em #{city_name} em #{day_month}."
  end


  def next_days next_days_weather
    temps = ""
    next_days_weather[:list].each do |forecast|
      temp = forecast[:temperature_average].floor(0)
      date = Date.parse(forecast[:date])
      day_month = "#{date.day}/#{date.month}"
      is_last = next_days_weather[:list].last == forecast
      is_first = next_days_weather[:list].first == forecast
      comma = (is_last || is_first) ? "" : ", "
      and_ = is_last ? " e " : ""   
      temps = temps + "#{comma}#{and_}#{temp}°C em #{day_month}"
    end
    return " Média para os próximos dias: #{temps}."
  end
end

