class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user


  # def add_item(item_id)
  #   item = line_items.find_by(item_id: item_id)
  #           # lineitem_(item_id: 19, cart_id: )
  #   if item
  #     item.quantity += 1
  #   else
  #     item = line_items.create(item_id: item_id)
  #   end
  #   item.save
  #   item
  # end

  # This would be similar to
# cart.items.pluck(:id)

# item_ids
#Which is similar to:
# items.each blah blah


  def add_item(item_id)
    if item_ids.include?(item_id.to_i)
      line_item = line_items.find_by(item_id)
      line_item.update(quantity: line_item.quantity + 1)
      line_item
    else
      line_items.build(item_id: item_id, quantity: 1)
    end
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
