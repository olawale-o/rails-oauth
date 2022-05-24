class V1::SocialAuthController < ApplicationController
  def authenticate_social_auth_user
    @user = User.signin_or_create_from_provider(set_params)
    if @user.persisted?
      sign_in(@user)
      login_token = @user.create_new_auth_token
      render json: {
        status: 'SUCCESS',
        message: "user was successfully logged in through #{set_params[:provider]}",
        headers: login_token
      },
             status: :created
    else
      render json: {
        status: 'FAILURE',
        message: "There was a problem signing you in through #{set_params[:provider]}",
        data: @user.errors
      },
             status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:user).permit(:provider, :uid, info: [:email])
  end
end
