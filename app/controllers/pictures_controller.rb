class PicturesController < ApplicationController
  before_action :confirm_logged_in, only: :destroy

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to edit_advertisement_path(@picture.advertisement_id)
  end
end
