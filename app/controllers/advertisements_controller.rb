class AdvertisementsController < ApplicationController
  before_action :confirm_logged_in, :only => [:edit]

  def view
    @user = User.find(session[:user_id])
    @advertisements = @user.advertisements.newest_first
  end

  def index
    @advertisements = Advertisement.all
    if params[:search_name]
      @advertisements = @advertisements.search_name(params[:search_name])
    end
    if params[:search_location]
      @advertisements = @advertisements.search_location(params[:search_location])
    end
    if params[:category]
      @advertisements = @advertisements.search_category(params[:category])
    end
    if params[:sub_category_id]
      @advertisements = @advertisements.search_sub_category(params[:sub_category_id])
    end
  end

  def show
    @advertisement = Advertisement.find(params[:id])
    @comments = @advertisement.comments.newest_first
    @pictures = @advertisement.pictures
  end

  def new
     if user_signed_in?
       @advertisement = Advertisement.new(:user_id => current_user.id)
     else
       @advertisement = Advertisement.new
     end
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    if user_signed_in?
      @advertisement.user = current_user
    end
    if @advertisement.save
      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @advertisement.pictures.create(image: image)
        }
      end
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

  def destroy
    @advertisement = Advertisement.find(params[:id])
    if CartProduct.where(advertisement_id: @advertisement.id)
      @cart_products = CartProduct.where(advertisement_id: @advertisement.id)
      @cart_products.each do |cart_product|
        cart_product.destroy
      end
    end
    @advertisement.destroy
    redirect_to(advertisements_view_path)
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:name, :description, :price, :location, :category_id, :sub_category_id, :user_id, :user_username, :user_contact_no)
  end
end
