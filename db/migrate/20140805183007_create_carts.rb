class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :line_item_id
      t.integer :user_id
    end 
  end
end
