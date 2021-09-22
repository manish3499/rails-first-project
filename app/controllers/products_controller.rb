class ProductsController < ApplicationController
  before_action :save_url, except: :create

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    #Use the view
  end

  def create
    product = Product.create!(title: params["title"], price: params["price"].to_f, category: params["category"], description: params["description"], image: params["image"])
    #render json: {message: "Product added", product_id: product.id}
    redirect_to "/products/new"
  end

  private
  def save_url
    session[:redirect_url] = request.original_url
  end
end
