require 'test_helper'
require 'mocha/minitest'

class CreateTweetTest < ActionDispatch::IntegrationTest
  test "tweet city forecast" do

    OpenWeatherRaoni::OpenWeatherMapApi.
      any_instance.stubs(:current_weather).returns(current_weather())

    OpenWeatherRaoni::OpenWeatherMapApi.
      any_instance.stubs(:next_five_days_forecast).returns(next_days_forecast())

    Twitter::REST::Client.
      any_instance.stubs(:update).returns("")

    post api_v1_tweets_path, as: :json, params: params

    assert_response :ok
  end

  test "wrong city name" do

    OpenWeatherRaoni::OpenWeatherMapApi.
      any_instance.stubs(:current_weather).returns(error())

    OpenWeatherRaoni::OpenWeatherMapApi.
      any_instance.stubs(:next_five_days_forecast).returns(next_days_forecast())

    post api_v1_tweets_path, as: :json, params: params

    assert_response :bad_request

    body = JSON.parse(response.body)
    assert_equal body["message"], "city not found"
  end

  def params
    {
      api_key: "api_key",
      city: "pato branco,BR"
    }
  end
end
