class FavouritesController < ApplicationController

  def index
    @favourite_restaurants = Favourite.where(user_id: current_user.id, favouriteable_type: "Restaurant")
    @favourite_foods = Favourite.where(user_id: current_user.id, favouriteable_type: "FoodItem")
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.delete
    @favourite_restaurants = Favourite.where(user_id: current_user.id, favouriteable_type: "Restaurant")
    @favourite_foods = Favourite.where(user_id: current_user.id, favouriteable_type: "FoodItem")
      respond_to do |format|
        format.html { redirect_to favourites_path, notice: 'Favourite was successfully destroyed.' }
        format.js
      end
  end
end
