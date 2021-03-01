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
end