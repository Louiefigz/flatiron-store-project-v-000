class CartsController < ApplicationController

  def show 
    @cart = Cart.find(params[:id])
    @user = User.find(@cart.user_id)
    @current_cart = @user.current_cart
  end

end
