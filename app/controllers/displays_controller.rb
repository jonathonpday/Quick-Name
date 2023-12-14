class DisplaysController < ApplicationController
  before_action :find_user

  def new
    @display = @user.displays.build
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def show_params
    params.require(:show).permit(:title, contents_attributes: [:id, :title, :picture, :audio, :_destroy])
  end
end
