class AddOrderIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :order_id, :integer, :default => -1
  end
end
