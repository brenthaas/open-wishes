class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { error: 'Unauthorized', status: 401 }, status: :unauthorized
    end
  end

  def logged_in
    if @current_user
      render json: { logged_in: true, user: @current_user }
    else
      render json: {
        logged_in: false
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
