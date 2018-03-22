json.addresses	do 
	json.array!(@addresses) do |address|
		json.name address.name
		json.url address_path(address)	
	end

end

