class OrdersController < ApplicationController
  def create
    sql = "select * from cart_items left join products on cart_items.product_id = products.id where cart_items.order_id = -1 and cart_items.user_id = #{session[:user_id]}"
    @cart_items_array = ActiveRecord::Base.connection.exec_query(sql)
    @grand_total = 0
    @cart_items_array.each do |row|
      @grand_total = @grand_total + (row["price"] * row["quantity"])
    end

    discount = Coupon.find_by(code: params["coupon"]).discount_percent
    discount = @grand_total * discount
    paid = @grand_total - discount

    order = Order.create!(total: @grand_total, discount: discount, paid: paid, user_id: session[:user_id])
    order_id = order.id

    cart_items = CartItem.where({user_id: session["user_id"], order_id: -1})
    cart_items.each do |item|
      item.update(order_id: order_id)
    end
  end

  def index
    #user_id = session["user_id"]
    sql = "select * from cart_items left join products on cart_items.product_id = products.id where cart_items.order_id <> -1 and cart_items.user_id = #{session[:user_id]} order by cart_items.order_id"
    @order_items_array = ActiveRecord::Base.connection.exec_query(sql)

    @orders_details = {}
    orders = Order.where({user_id: session["user_id"]})
    orders.each do |item|
      @orders_details[item.id] = {total: item.total, discount: item.discount}
    end

  end
end
