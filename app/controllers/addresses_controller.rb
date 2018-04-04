class AddressesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
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

  def edit; end

  def show; end

  def update
    if @address.update(address_params)
      redirect_to @address
    else
      render 'edit'
    end
  end

  def change_city
    params[:state]
    @state = CS.states(:in).key(params[:state])
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
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
