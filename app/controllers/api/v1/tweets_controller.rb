class Api::V1::TweetsController < ApplicationController
  def create
    render json: {}, status: :ok
  end
end