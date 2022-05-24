class V1::PrivateController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
      success: :ok,
      current_user:
    }
  end
end
