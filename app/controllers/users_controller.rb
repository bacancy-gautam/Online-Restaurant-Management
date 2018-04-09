# Controller for Users
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = create_user
    @user.save ? (UserMailer.user_registration_mail(@user).deliver_now)  : (render 'new') 
    @users = User.all
    respond_to do |format|
      format.html { render(partial: 'users') }
      format.js
    end
  end

  def index
    # if params[:search]
    #   @users = User.search(params[:search])
    #   respond_to do |format|
    #     format.html { render(partial: 'users') }
    #     format.js
    #   end
    # else
      @users = User.all
      respond_to do |format|
        format.html
        format.js
      end
    # end
  end

  def edituser
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = User.find(params[:id])
    @addresses = Address.where(addressable_id: current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @users = User.all
      respond_to do |format|
        format.html do
          render(partial: 'users')
        end
        format.js
      end
    else
      render 'edituser'
    end
  end

  def updateprofile
    @user = current_user
    if @user.update(user_profile_params)
      # binding.pry
      respond_to do |format|
        format.html do
          render(partial: 'userprofile')
        end
        format.js
      end
    else
      render 'edituser'
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html do
        render(partial: 'showuser')
      end
      format.js
    end
  end

  def destroy
    @users = User.all 
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { render(partial: 'users') }
      format.js
    end
  end

  def change_password_edit
    @user = current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def change_password_update
    @user = current_user
    if @user.update_with_password(change_password_params)
      flash[:success] = 'Password updated'
      bypass_sign_in(@user)
      respond_to do |format|
        format.html do
          render(partial: 'userprofile')
        end
        format.js
      end
    else
      render 'change_password_edit'
    end
  end

  def role_assign
    @users = User.all
    @roles = Role.all 
  end

  def assign_role
    @users = User.all
    @user = User.find(params[:id])
    @roles = Role.all 
    @role = Role.find(params[:role_id])
    @user.roles.delete_all
    @user.add_role @role.name
    respond_to do |format|
      format.html { render(partial: 'role_assign') }
      format.js
    end
  end

  def change_user_status
    @user = User.find(params[:id])
    @user.is_active = !@user.is_active
    @user.save
  end

  def profile
    @user = current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def add_address
    @address = Address.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def user_profile_params
    params.permit(:firstname, :lastname, :username, 
                                  :phoneno, :email, :image, :role_id)
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, 
                                  :phoneno, :email, :image, :role_id)
  end

  def change_password_params
    params.require(:user).permit(:current_password, :password,
                                 :password_confirmation)
  end

  def create_user
    User.new(user_params) do |user|
      password = SecureRandom.hex(8)
      user.password = password
    end
  end
end
