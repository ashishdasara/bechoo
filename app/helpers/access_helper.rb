module AccessHelper

  def log_in(authorized_user)
    session[:user_id] = authorized_user.id
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

  def confirm_logged_in
      unless user_signed_in?
         redirect_to access_login_path
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
