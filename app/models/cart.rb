class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user


  def add_item(item_id)
    item = line_items.find_by(item_id: item_id)
            # lineitem_(item_id: 19, cart_id: )
    if item
      item.quantity += 1
    else
      item = line_items.create(item_id: item_id)
    end
    item
  end

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def checkout
    self.update(status: 'submitted')
    line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    self.line_items.clear
  end

end
