require 'test_helper'

class CreateTweetTest < ActionDispatch::IntegrationTest
  test "tweet city forecast" do
    post api_v1_tweets_path, as: :json, params: params

    assert_response :ok
  end

  def params
    {
      api_key: "api_key",
      city: "pato branco,BR"
    }
  end
end
