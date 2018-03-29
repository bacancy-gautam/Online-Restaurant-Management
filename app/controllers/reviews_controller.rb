class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
  end
private

  def review_params
    params.require(:review).permit(:user_id,:comment)
  end
end