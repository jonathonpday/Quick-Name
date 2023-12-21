class ContentsController < ApplicationController
  before_action :find_user_and_display, only: [:new, :create, :destroy]

  def new
    @content = @display.content.build
  end

  def create
    @content = @display.content.build(content_params)

    if @content.save
      redirect_to user_display_path(@user, @display), notice: 'Content was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def find_user_and_display
    @user = User.find(params[:user_id])
    @display = Display.find(params[:display_id])
  end

  def content_params
    params.require(:content).permit(:title, :image)
  end
end
