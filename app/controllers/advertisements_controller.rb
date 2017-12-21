class AdvertisementsController < ApplicationController

  before_action :require_proper_route_for_role, only: [:index, :new, :edit, :show, :view]
  before_action :confirm_logged_in, only: [:edit, :update]
  before_action :is_admin, only: :approve

  def index
    @advertisements = Advertisement.approved

    @advertisements = @advertisements.search_name(params[:search_name]) if params[:search_name]

    @advertisements = @advertisements.search_location(params[:search_location]) if params[:search_name]

    @advertisements = @advertisements.search_category(params[:category]) if params[:category]

    @advertisements = @advertisements.search_sub_category(params[:sub_category_id]) if params[:sub_category_id]
  end

  def show
    @advertisement = Advertisement.includes(:conversations).find(params[:id])
    @comments = @advertisement.comments.newest_first.approved
    @pictures = @advertisement.pictures
  end

  def new
     if user_signed_in?
       @advertisement = Advertisement.new(user_id: current_user.id)
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
        params[:images].each { |image|
          @advertisement.pictures.create(image: image)
        }
      else
        path = Rails.root.join "public", "assets", "images", "missing.png"
        file = File.open(path)
        @picture = @advertisement.pictures.new
        @picture.image=file
        file.close
        @picture.save
      end
      flash[:notice] = "Advertisement created. Will be posted after approval!"
      redirect_to(advertisements_path)
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
      if params[:images]
        params[:images].each { |image|
          @advertisement.pictures.create(image: image)
        }
      end
      flash[:notice] = "Advertisement updated"
      redirect_to(advertisement_path(@advertisement))
    else
      render('edit')
    end
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    if params[:admin_task] == "approval_delete"
      redirect_to(view_advertisements_path(admin_task: params[:admin_task]))
    elsif params[:admin_task] == "index_delete"
      redirect_to(advertisements_path)
    else
      redirect_to(view_advertisements_path)
    end
  end

  def view
    if params[:admin_task] == "new_advertisements"
      @advertisements = Advertisement.unapproved.unrejected
    elsif params[:admin_task] == "rejected_advertisements"
      @advertisements = Advertisement.unapproved.rejected
    else
      @user = User.find(session[:user_id])
      @advertisements = @user.advertisements.newest_first
    end
  end

  def approve
    @advertisement = Advertisement.find(params[:id])
    @advertisement.approved = true
    @advertisement.rejected = false
    @advertisement.save
    redirect_to view_advertisements_path(admin_task: "new_advertisements")
  end
  def reject
    @advertisement = Advertisement.find(params[:id])
    @advertisement.rejected = true
    @advertisement.save
    redirect_to view_advertisements_path(admin_task: "new_advertisements")
  end
  private

  def advertisement_params
    params.require(:advertisement).permit(:name, :description, :price, :location, :category_id, :sub_category_id, :user_id, :user_username)
  end

end
