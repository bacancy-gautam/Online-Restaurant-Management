class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.name = current_user.username
    @review.save
  end
private

  def review_params
    params.require(:review).permit(:user_id,:comment,:name)
  end
end