class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :line_items, through: :carts
  has_many :items, through: :line_items
  has_many :orders

  #  belongs_to :current_cart, class_name: "Cart"


  def current_cart=(current_cart)
    self.carts.unshift(current_cart)
  end

  def current_cart

    if !self.carts[0].nil?
      self.carts[0]
    end
  end

  def find_carts
    if current_cart != nil
      current_cart
    else
      Cart.create(user_id: self.id )
    end
  end

end
