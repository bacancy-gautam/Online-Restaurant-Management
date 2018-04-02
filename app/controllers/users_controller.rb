# Controller for Users
class UsersController < ApplicationController
  def new; end

  def create; end

  def index
    @users = User.all
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

  def change_password_edit
    @user = current_user
  end

  def change_password_update
    @user = current_user

    if @user.update_with_password(change_password_params)
      # Sign in the user by passing validation in case their password changed
      flash[:success] = 'Password updated'
      bypass_sign_in(@user)
      redirect_to @user
    else
      render 'change_password_edit'
    end
  end

  def assign_role
    @user = User.find(params[:id])
    @role = Role.find(params[:role_id])
    @user.roles.delete_all
    @user.add_role @role.name
    redirect_to static_pages_my_account_path
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, 
                                  :phoneno, :email, :image)
  end

  def change_password_params
    params.require(:user).permit(:current_password, :password,
                                 :password_confirmation)
  end
end
