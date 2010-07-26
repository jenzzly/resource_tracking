class StaticPageController < ApplicationController
  before_filter :require_user
  #authorize_resource
  def index
  end

  def show
    render :action => params[:page]
  end
end

