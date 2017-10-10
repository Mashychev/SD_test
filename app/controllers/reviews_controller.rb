class ReviewsController < ApplicationController

  def index
    @id = params[:id]
    @reviews = Review.where(item_id: @id)
  end

  def filter
    @reviews = Review.where(item_id: params[:id]).where("text like ?", "%#{params[:keyword]}%")
  end
end
