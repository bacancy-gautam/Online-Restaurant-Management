json.addresses	do 
	json.array!(@addresses) do |address|
		json.name address.street + ", " + address.city 
    
		json.url area_path(street: address.street)
	end

end

