class CartController < ApplicationController
  before_action :check_login

  def index
    # @cart_items = CartItem.all

    sql = "select * from cart_items left join products on cart_items.product_id = products.id where cart_items.order_id = -1 and cart_items.user_id = #{session[:user_id]}"
    @cart_items_array = ActiveRecord::Base.connection.exec_query(sql)
    @grand_total = 0
    @cart_items_array.each do |row|
      @grand_total = @grand_total + (row["price"] * row["quantity"])
    end
  end

  def create
    cart_item = CartItem.create!(user_id: session[:user_id], product_id: params["product_id"].to_i, quantity: params["quantity"].to_i, order_id: -1)
    #render json: {message: "success"}
    redirect_to "/products"
  end

  def check_login
    if !session[:user_id]
      redirect_to "/login"
      return
    end
  end
end
