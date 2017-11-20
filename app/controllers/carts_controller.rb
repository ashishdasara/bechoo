class CartsController < ApplicationController
  before_action :confirm_logged_in
  before_action :require_proper_route_for_role, only: :index

  def index
    @cart = Cart.find(session[:cart_id])
  end

end
