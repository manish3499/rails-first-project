class TestController < ApplicationController
  before_action :before1
  before_action :before2
  after_action :after

  def index
    p "+++++++++++++++++++++ during +++++++++++++++++++++++++"
    redirect_to root_path
    return false
  end

  private
  def before1
    p "+++++++++++++++++++++ before1 #{request.original_url} +++++++++++++++++++++++++"
    #redirect_to root_url
  end
  def before2
    p "+++++++++++++++++++++ before2 +++++++++++++++++++++++++"
    #redirect_to root_url
  end
  def after
    p "+++++++++++++++++++++ after +++++++++++++++++++++++++"
  end
end
