class ItemsController < ApplicationController
  def create
    walmart_id = params[:url].match(/\d*$/).to_s
    ItemsService.new(walmart_id)
    redirect_to :controller => 'reviews', :action => 'index', :id => walmart_id
  end
end
