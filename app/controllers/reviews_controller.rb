class ReviewsController < ApplicationController

  def new

  end

  def create

    @restaurant = Restaurant.find(params[:article_id])
    @review = @restaurant.reviews.create(review_params)
    @review.save
    redirect_to @review
  end

  def show
    @review = Review.find(params[:id])
  end


private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
