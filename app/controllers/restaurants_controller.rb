class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
	end

	def create
		restaurant = Restaurant.new(name: params[:name], description: params[:description])
		flash[:success] = "Restaurant was successfully added" if restaurant.save
		redirect_to '#index'
	end

end
