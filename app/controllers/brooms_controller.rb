class BroomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @brooms = Broom.all
  end

  def show
    @broom = Broom.find(params[:id])
  end

  def new
    @broom = Broom.new
  end

  def create
    @broom = Broom.new(broom_params)
    if @broom.save
      redirect_to broom_path(@broom)
    else
      render :new
    end
  end

  private

  def broom_params
    params.require(:broom).permit(:name, :description, :photo, :price)
  end

end
