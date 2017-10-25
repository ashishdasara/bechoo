class UsersController < ApplicationController
  def index
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
      flash[:notice] = "Signup Successful"
      redirect_to(access_menu_path)
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

  def delete
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :contact_no)
  end
end
