require "test_helper"

class ApplicationControllerTest < ActiveSupport::TestCase
  setup do
    @today_message = "22°C e céu limpo em Pato Branco em 27/2."
    @next_days_message = " Média para os próximos dias: 19°C em 28/2, 20°C " +
      "em 1/3, 20°C em 2/3, 20°C em 3/3 e 19°C em 4/3."
  end

  test "should parse a readable forecast message" do
    controller = ApplicationController.new
    message = controller.format_weather_text current_weather, 
      next_days_forecast, "pato branco,BR", Date.new(2021,2,27)

    assert_equal @today_message + @next_days_message, message
  end

  test "should test method today message" do
    controller = ApplicationController.new
    message = controller.today_message current_weather, 
      "pato branco,BR", Date.new(2021,2,27)

    assert_equal @today_message, message
  end


  test "should test next days message" do
    controller = ApplicationController.new
    message = controller.next_days next_days_forecast

    assert_equal @next_days_message, message
  end

  def current_weather
    return {
      :temperature => 22.44,
      :weather => "céu limpo"
    }
  end

  def next_days_forecast
    return {
      :list => [
        {
          :temperature_average => 19.95,
          :date => "2021-02-28"
        },
        {
          :temperature_average =>  20.45,
          :date => "2021-03-01"
        },
        {
          :temperature_average => 20.78,
          :date => "2021-03-02"
        },
        {
          :temperature_average => 20.73,
          :date => "2021-03-03"
        },
        {
          :temperature_average => 19.83,
          :date => "2021-03-04"
        }
      ]
    }
  end
end