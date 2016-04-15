class CartsController < ApplicationController
before_filter :set_cart, only: [:checkout]
  def show
    @cart = Cart.find(params[:id])
   end

   def checkout

       @cart.checkout

       current_user.current_cart = nil


       redirect_to cart_path(@cart), notice: 'Thanks for your order!'
    end

  private
  def set_cart
    @cart = Cart.find(params[:id])
    redirect_to store_path if @cart.nil?
  end

end
