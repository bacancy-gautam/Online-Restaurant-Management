json.restaurants	do 
	json.array!(@restaurants) do |restaurant|
		json.name restaurant.name
		json.url restaurant_path(restaurant)	
	end

end

json.fooditems	do 
	json.array!(@fooditems) do |food|
		json.name food.name
		json.url food_item_path(food)	
	end

end