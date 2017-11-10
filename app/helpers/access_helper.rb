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
    session.delete(:cart_id)
    @current_user = nil
  end

  def confirm_logged_in
    unless user_signed_in?
      flash[:notice] = "Please sign in."
      redirect_to(login_path)
    end
  end

  def is_admin
    unless current_user.admin
      flash[:notice] = "You don't the required permissions."
      redirect_to advertisements_path
    end
  end

  def set_cart
    if Cart.where(user_id: current_user.id).present?
      @cart = Cart.where(user_id: current_user.id).first
      session[:cart_id]= @cart.id
    else
      @cart = Cart.create(user_id: current_user.id)
      session[:cart_id] = @cart.id
    end
  end
end
