class UserSessionsController < ApplicationController
  layout 'user_session'

  rescue_from UnauthorizedError, with: :handle_unauthorized_error

  skip_before_action :authenticate_user!

  def new
    sign_in_and_redirect(current_user) if user_signed_in?
  end

  def create
    attrs = {
      username: params[:username],
      password: params[:password]
    }
    authenticate_user = AuthenticateUser.call(attrs: attrs)

    sign_in_and_redirect(authenticate_user.user)
  end

  def destroy
    sign_out_and_redirect
  end

  private

  def handle_unauthorized_error
    flash.now[:danger] = 'Username/Password is not correct'
    render :new
  end
end