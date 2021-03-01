require 'test_helper'

class CreateTweetTest < ActionDispatch::IntegrationTest
  test "tweet city forecast" do
    post "tweet", as: :json, params: params

    assert_response true
  end

  def params
    {
      api_key: "api_key",
      city: "pato branco,BR"
    }
  end
end
