class BroomsController < ApplicationController
  def index
    @brooms = Broom.all
  end

  def show
    @broom = Broom.find(params[:id])
    @broom = Broom.new
  end

  def new
    @broom = Broom.new
  end

  def create
    @broom = Broom.new(broom_params)
    @broom.user = current_user
    if @broom.save
      redirect_to brooms_path, notice: 'Broom was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def broom_params
    params.require(:broom).permit(:name, :description, :photo, :price)
  end
end
