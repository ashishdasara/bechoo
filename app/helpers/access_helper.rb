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
      flash[:notice] = "Please sign in."
      redirect_to(login_path)
    end
  end

  def is_admin
    unless current_user.admin == true
      flash[:notice] = "You don't the required permissions."
      redirect_to advertisements_path
    end
  end

end
