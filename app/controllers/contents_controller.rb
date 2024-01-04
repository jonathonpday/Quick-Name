class ContentsController < ApplicationController
  before_action :find_user_and_display, only: [:new, :create, :destroy]

  def new
    @content = @display.contents.build
    @errors = flash[:errors] || []
  end

  def create
    if @display.contents.count >= 3
      redirect_to user_display_path(@user, @display), alert: 'Maximum number of contents (3) reached for this display.'
    else
      @content = @display.contents.create(content_params)
      if @content.save
        redirect_to new_user_display_content_path(user_id: @user.id, display_id: @display.id), notice: 'Content was successfully created.'
      else
        flash[:errors] = @content.errors.full_messages
        redirect_to new_user_display_content_path(user_id: @user.id, display_id: @display.id)
      end
    end
  end

  def destroy
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_user_and_display
    @user = User.find(params[:user_id])
    @display = Display.find(params[:display_id])
  end

  def content_params
    params.require(:content).permit(:title, :image, :audio)
  end
end
