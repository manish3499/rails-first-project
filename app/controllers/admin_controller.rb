class AdminController < ApplicationController
  def index
    redirect_to login_path
  end
end
