class AdvertisementsController < ApplicationController
  before_action :confirm_logged_in, :only => [:new, :index, :show, :edit]


  def view
    @user = User.find(session[:user_id])
    @advertisements = @user.advertisements
  end

  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new(:user_id => current_user.id)
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.user = current_user
    if @advertisement.save
      flash[:notice] = "Advertisement created. Wait till it is approved"
      redirect_to(advertisement_path(@advertisement))
    else
      render('new')
    end

  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end

  def update
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.update_attributes(advertisement_params)
      flash[:notice] = "Advertisement updated"
      redirect_to(advertisement_path(@advertisement))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    redirect_to(advertisements_view_path)
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:image, :name, :description, :price, :location, :category_id, :sub_category_id, :user_id)
  end
end
