module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

   def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in_user
      unless user_signed_in?
         redirect_to login_url
      end
   end

def exclusive_admin
  if current_user.admin==false
    redirect_to dash_welcome_path
  end
end

   def session_active
    if user_signed_in?
      redirect_to dash_welcome_path
    end
  end
end
