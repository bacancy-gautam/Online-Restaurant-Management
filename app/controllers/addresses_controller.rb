# address controller
class AddressesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    # @addresses = Address.all
    @addresses = Address.where(addressable_id: current_user.id)
  end

  def new
    @address = Address.new
  end

  def create
    # @address = Address.new(address_params)
    @address = current_user.addresses.create(address_params)
    if @address.save
      redirect_to @address
    else
      render 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    @addresses = current_user.addresses
  end

  def change_city
    params[:state]
    @state = CS.states(:in).key(params[:state])
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  def view_address
    @addresses = Address.where(addressable_id: current_user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:addressline, :area, :city,
                                    :state, :pincode)
  end
end
