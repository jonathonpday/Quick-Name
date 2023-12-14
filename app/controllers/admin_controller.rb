class AdminController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :authenticate_user!
  before_action :authorise_admin!
  
  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_index_path, notice: 'User created'
    else
      redirect_to admin_index_path, alert: 'Unable to create user'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_index_path, notice: 'User updated'
    else
      redirect_to admin_index_path, alert: 'Unable to update user'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_index_path, notice: "User Deleted"
    else
      redirect_to admin_index_path, alert: "Unable to Delete User"
    end
  end

  private

  def authorise_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end