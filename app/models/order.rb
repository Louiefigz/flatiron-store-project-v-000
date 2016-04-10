class Order < ActiveRecord::Base

  belongs_to :user_id
  belongs_to :cart_id
  
end
