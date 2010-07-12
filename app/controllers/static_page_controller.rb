class StaticPageController < ApplicationController
  before_filter :require_user



  def show
    render :action => params[:page]
  end
   PAGES = %w[about, contact, ngo_dashboard, govt_dashboard] #allowable (non-index) pages rendered by show action
end

