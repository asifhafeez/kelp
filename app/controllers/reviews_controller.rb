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

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.find(params[:id])
		if current_user && (current_user.id == @review.user.id)
			@review.destroy
    else
			flash[:error] = "You can only delete your own reviews"
		end
    redirect_to @restaurant
	end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
