class UsersController < ApplicationController
  before_action :is_admin, only: :index

  before_action :require_proper_route_for_role, only: [:index, :new, :edit, :show, :edit_password]
  def index
    if params[:admin_task] == "new_admins"
      @users = User.not_admin
    end
  end

  def show
    @user= User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      flash[:notice] = "Signup Successful!"
      log_in(@user)
      redirect_to(advertisements_path)
    else
      render(new_user_path)
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated..."
      redirect_to(user_path(@user))
    else
      render('edit')
    end

  end

  def admin
    @user= User.find(params[:id])
    if params[:admin_task] == "new_admins"
      @user.admin =true
      @user.save
      redirect_to(users_path(admin_task: "new_admins"))
    end
  end

  def edit_password
    @user = User.find(session[:user_id])
  end

  def change_password
    @user = User.find(session[:user_id])
    if params[:current_password].present?
      authorized_user = @user.authenticate(params[:current_password])
      if authorized_user
        @user.update_attributes(user_password_params)
        flash[:notice]= "Changed Successfully!"
        redirect_to user_path(@user)
      else
        flash[:notice] = "Failed changing password! Retry again."
        render 'edit_password'
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :contact_no, :location, :password, :password_confirmation, :admin, :uid)
  end
  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
