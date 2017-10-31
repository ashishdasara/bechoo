class CartsController < ApplicationController
  before_action :confirm_logged_in
  def index
    @cart = Cart.find(session[:cart_id])
  end

end
