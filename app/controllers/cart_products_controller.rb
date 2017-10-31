class CartProductsController < ApplicationController
  before_action :confirm_logged_in, only: [:create, :update, :destroy]
  def index
  end

  def create
    @cart = Cart.find(session[:cart_id])
    @advertisement = Advertisement.find(params[:advertisement_id])
    if CartProduct.where(cart_id: @cart.id, advertisement_id: @advertisement.id).present?
      @cart_product = CartProduct.where(cart_id: @cart.id, advertisement_id: @advertisement.id).first
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(:advertisement_id => @advertisement.id)
      @cart_product.cart = @cart
    end
    if @cart_product.save
      flash[:notice] = "Product added to cart..."
      redirect_to carts_path
    else
      flash[:notice] = "there has been a problem. try again..."
      redirect_to advertisements_path
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update_attributes(cart_product_params)
      flash[:notice] = "Updated Successfully..."
      redirect_to carts_path
    else
      flash.now[:notice] = "Something's wrong!!!..."
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:notice] = "Removed from cart..."
    redirect_to carts_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end
end
