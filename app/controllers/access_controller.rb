class AccessController < ApplicationController
  include AccessHelper
  before_action :confirm_logged_in, :only => :menu


  def menu

  end

  def login
  end

  def signup
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      log_in(authorized_user)
      flash[:notice] = "You are now logged in."
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
end
