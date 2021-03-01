class Api::V1::TweetsController < ApplicationController
  def create
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end

    open_weather_api = OpenWeatherRaoni::OpenWeatherMapApi.new params[:api_key]

    city = params[:city]

    current_weather = open_weather_api.
      current_weather city
    next_days_forecast = open_weather_api.
      next_five_days_forecast city
    
    if (current_weather[:error] || next_days_forecast[:error])
      message = current_weather[:error] ? current_weather[:message] : next_days_forecast[:error]
      render json: { message: message}, status: :bad_request
    else
      tweet = format_weather_text(current_weather, 
      next_days_forecast, city, Date.today)

      client.update(tweet)

      render json: {}, status: :ok
    end
  end
end