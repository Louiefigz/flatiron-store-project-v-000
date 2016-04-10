class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  belongs_to :orders
  has_one :status, through: :orders


  def add_item

  end 

end
