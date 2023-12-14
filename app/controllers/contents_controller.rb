class ContentsController < ApplicationController
  before_action :find_user_and_display, only: [:new, :create]

  def new
    @content = @display.contents.build
  end

  private

  def find_user_and_display
    @user = User.find(params[:user_id])
    @display = @user.displays.find(params[:display_id])
  end
end