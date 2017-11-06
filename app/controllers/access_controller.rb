class AccessController < ApplicationController
  before_action :confirm_logged_in, :only => :menu


  def menu

  end

  def login
  end

  def attempt_login
    if params[:session][:username].present? && params[:session][:password].present?
      found_user = User.where(:username => params[:session][:username].downcase).first
      if found_user
        authorized_user = found_user.authenticate(params[:session][:password])
      end
    end

    if authorized_user
      log_in(authorized_user)
      flash[:notice] = "You are now logged in."
      set_cart
      redirect_to(advertisements_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
    log_out
    flash[:notice] = "Logged out..."
    redirect_to(access_login_path)
  end

  private

end
