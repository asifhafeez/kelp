class ReviewsController < ApplicationController

  def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

  def create

    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @restaurant
    else
      render 'new'
    end

  end

  def show
    @review = Review.find(params[:id])
  end


private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
