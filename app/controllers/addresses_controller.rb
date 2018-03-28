class AddressesController < ApplicationController
	def index
	  @addresses = Address.all
	end

	def new
	  @address = Address.new
	end

	def create
	  @address = Address.new(address_params)
	  if @address.save
	    redirect_to @address
	  else
	    render 'new'
	  end
	end

	def edit; end

	def show; end

	def update
	  if @address.update(address_params)
	    redirect_to @address
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @address.destroy
	  redirect_to addresses_path
	end

	private

	def set_address
	  @address = Address.find(params[:id])
	end

	def food_item_params
	  params.require(:address).permit(:addressline, :street, :city, :state, :pincode)
	end
end
