class LoginController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params["username"]).try(:authenticate, params["password"])

    if user
      session[:user_id] = user.id
      # render json: {
      #   status: :created,
      #   logged_in: true,
      #   user: user
      # }
      if user.user_group == "customer"
        # render json: {message: "customer login"}
        session[:type] = "customer"
        redirect_to "/products"
      elsif user.user_group == "admin"
        #render json: {message: "admin login"}
        redirect_to "/products/new"
      else
        #should not happen
      end
    else
      render json: {status: 401}
    end
  end

  def logout
    session[:user_id] = nil
    session[:type] = nil
    redirect_to "/products"
  end
end
