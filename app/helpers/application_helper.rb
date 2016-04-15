module ApplicationHelper


  def current_cart
    current_user.current_cart
  end

  def total
    total = 0
    @user.items.collect do |item|
      binding.pry

    end

  end


end
