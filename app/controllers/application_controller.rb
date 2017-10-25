class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

private



def confirm_logged_in
  unless session[:user_id]
    flash[:notice] = "Please log in."
    redirect_to(access_login_path)
    # redirect_to prevents requested action from running
  end
end

end
