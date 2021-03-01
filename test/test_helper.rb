ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  def current_weather
    return {
      :error => false,
      :temperature => 22.44,
      :weather => "céu limpo"
    }
  end

  def next_days_forecast
    return {
      :error => false,
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

  def error
    return {
      :error => true,
      :message => "city not found"
    }
  end
end
