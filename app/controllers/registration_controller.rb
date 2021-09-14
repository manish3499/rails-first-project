class RegistrationController < ApplicationController

  def new
    #Use the view directly
  end

  def create
    user = User.create!(email: params["email"], password: params["password"], password_confirmation: params["password_confirmation"], user_group: params["usergroup"])
    render json: {message: params["usergroup"]}
  end
end
