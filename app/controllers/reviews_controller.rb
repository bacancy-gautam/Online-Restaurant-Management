class ReviewsController < ApplicationController

  def create
    # @restaurant = Restaurant.find(params[:review][:restaurant_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.name = current_user.username
    @review.save
    respond_to do |format|
      format.html do
        redirect_to restaurant_path(@restaurant.id),
        notice: 'Review Added.'
      end
      format.js
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:user_id,:comment,:name,:restaurant_id)
  end
end