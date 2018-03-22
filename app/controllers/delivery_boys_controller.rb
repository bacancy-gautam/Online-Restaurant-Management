class DeliveryBoysController < ApplicationController
  
  def index
    @delivery_boys = DeliveryBoy.all
  end

  def show
    @delivery_boy = DeliveryBoy.find(params[:id]) 
  end

  def edit
    @delivery_boy = DeliveryBoy.find(params[:id])
  end

  def update
    @delivery_boy = DeliveryBoy.find(params[:id])

    if @delivery_boy.update(delivery_boy_params)
      redirect_to @delivery_boy
    else
      render 'edit'
    end
  end

  def delete
    
  end

  def change_password_edit
    @delivery_boy = current_delivery_boy
  end

  def change_password_update
    @delivery_boy = current_delivery_boy
    if @delivery_boy.update_with_password(change_password_params)
      # Sign in the delivery_boy by passing validation in case their password changed
      flash[:success] = "Password updated"
      bypass_sign_in(@delivery_boy)
      redirect_to root_path
    else
      render "change_password_edit"
    end
  end

  private
    def delivery_boy_params
      params.require(:delivery_boy).permit(:firstname, :lastname, :username, :phoneno, :email)
    end

    def change_password_params
      params.require(:delivery_boy).permit(:current_password, :password, :password_confirmation)
    end
end
