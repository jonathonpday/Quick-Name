class DisplaysController < ApplicationController
  before_action :find_user, only: [:index, :new, :create, :show, :destroy]
  before_action :find_display, only: [:destroy]

  def index
    @display = @user.displays.all
  end

  def show
    @display = @user.displays.find(params[:id])
    @content = @display.contents
  end

  def new
    @display = Display.new
    @errors = flash[:errors] || []
  end

  def create
    @display = @user.displays.new(display_params)
    
    if @display.save
      redirect_to new_user_display_content_path(user_id: @user.id, display_id: @display.id), notice: 'Display was successfully created.'
    else
      flash[:errors] = @display.errors.full_messages
      redirect_to new_user_display_path(user_id: @user.id)
    end
  end


  def destroy
    @display.destroy

    respond_to do |format|
      format.html { redirect_to user_displays_url(@user), notice: "display was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_display
    @display = @user.displays.find(params[:id])
  end

  def display_params
    params.require(:display).permit(:title)
  end
end