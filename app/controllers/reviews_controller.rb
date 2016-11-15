class ReviewsController < ApplicationController

  def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

  def create

    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    redirect_to @restaurant

  end

  def show
    @review = Review.find(params[:id])
  end


private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
