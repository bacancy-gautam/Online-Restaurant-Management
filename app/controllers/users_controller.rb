# Controller for Users
class UsersController < ApplicationController

  
  def new
    @user = User.new
  end

  def create
    @users = User.all
    @user = create_user
    UserMailer.user_registration_mail(@user).deliver_now if @user.save
    respond_to do |format|
      format.html { render(partial: 'users') }
      format.js
    end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.js
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
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
  end

  def change_password_update
    @user = current_user

    if @user.update_with_password(change_password_params)
      flash[:success] = 'Password updated'
      bypass_sign_in(@user)
      redirect_to @user
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

  private

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
