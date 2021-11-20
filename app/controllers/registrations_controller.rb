class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { error: "Failed #{user.errors.full_messages.to_sentence}", status: 422 },
             status: :unprocessable_entity
    end
  end

  def logout
    reset_session
    render json: { logged_out: true, status: 200 }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
