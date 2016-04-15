class CartsController < ApplicationController
before_filter :set_cart, only: [:checkout]
  def show

    @cart = Cart.find(params[:id])
     if @cart.nil?
       @cart = current_user.find_carts
     end
   end

   def checkout
       @cart.checkout
       current_user.current_cart=nil
       if @cart.save && current_user.save
         respond_to do |format|
           format.html { redirect_to cart_path(@cart), notice: 'Thanks for your order!' }
         end
       end
     end

  private
  def set_cart
    @cart = current_user.current_cart
    redirect_to store_path if @cart.nil?
  end

end
