# Controller for Users
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @users = User.all
    @user = User.new(user_params) do |user|
      password = SecureRandom.hex(8)
      user.password = password
    end
    if @user.save
      UserMailer.user_registration_mail(@user).deliver_now
      respond_to do |format|
        format.html do
          render(partial: 'users')
        end
        format.js
      end
      #redirect_to static_pages_my_account_path
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
    if @user.destroy
      respond_to do |format|
        format.html do
          render(partial: 'users')
        end
        format.js
      end
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
    @role = Role.all 
  end

  def assign_role
    @users = User.all
    
    @user = User.find(params[:id])
    @role = Role.find(params[:role_id])
    @user.roles.delete_all
    @user.add_role @role.name
    # redirect_to static_pages_my_account_path
    respond_to do |format|
        format.html do
          render(partial: 'role_assign')
        end
        format.js{
          render(partial: 'role_assign')
        }
      end
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
