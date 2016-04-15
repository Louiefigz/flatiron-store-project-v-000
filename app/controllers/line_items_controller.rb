class LineItemsController < ApplicationController


  def create

    current_user.find_carts.add_item(params[:item_id]).save
    flash[:notice] = "submitted"
  
    redirect_to cart_path(current_user.current_cart)
  end

end
