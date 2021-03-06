class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		# Restaurant.create(params[:restaurant].permit(:name, :cuisine, :description, :images))
		@restaurant = Restaurant.new(params[:restaurant].permit(:name, :image))
		if @restaurant.save
			redirect_to restaurants_path
		else
			render 'new'
		end

	end



	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name, :cuisine, :description, :image))
		redirect_to restaurants_path
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = "Restaurants deleted successfully"
		redirect_to restaurants_path
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

end