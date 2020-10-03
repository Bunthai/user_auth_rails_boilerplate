module UserAuthenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    helper_method :current_user, :user_signed_in?

    protected

    def current_user
      User.find_by(id: session[:user_id])
    end

    def user_signed_in?
      session[:user_id].present?
    end

    def sign_in_and_redirect(user)
      sign_in(user)
      redirect_to root_path
    end

    def sign_out_and_redirect
      sign_out
      redirect_to new_user_session_path
    end

    private

    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def authenticate_user!
      unless user_signed_in?
        flash[:danger] = 'Login is required!'
        redirect_to new_user_session_path
      end
    end
  end
end
