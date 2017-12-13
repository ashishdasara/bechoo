class AccessController < ApplicationController
  before_action :confirm_logged_in, only: :admin
  before_action :is_admin, only: :admin

  def login
    if current_user
      flash[:notice] = "You are already logged in."
      redirect_to root_url
    end
  end
  def attempt_login
    if params[:session][:username].present? && params[:session][:password].present?
      found_user = User.where(username: params[:session][:username].downcase).first
      if found_user
        authorized_user = found_user.authenticate(params[:session][:password])
      end
    end

    if authorized_user
      log_in(authorized_user)
      flash[:notice] = "You are now logged in."
      if authorized_user.admin == true
        redirect_to(admin_index_path)
      else
        redirect_to(advertisements_path)
      end
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
    log_out
    flash[:notice] = "Logged out..."
    redirect_to(login_path)
  end

  def omni
    if user_signed_in?
      flash[:danger] = "You are already logged through an account"
      redirect_to root_url
    else
      hash  = request.env["omniauth.auth"]
      @user = User.find_or_create_from_auth_hash(hash)
      @user.set_defaults
      @user.save!
    	session[:user_id] = @user.id
    	redirect_to root_url
    end
  end

end
