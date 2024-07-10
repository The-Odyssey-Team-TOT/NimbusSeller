class BroomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @brooms = Broom.all
  end

  def show
    @broom = Broom.find(params[:id])
<<<<<<< HEAD
    @broom = Broom.new
=======
    @booking = Booking.new
>>>>>>> b6c3193c7044009445e08264ab5f414c0ce354e2
  end

  def new
    @broom = Broom.new
  end

  def create
    @broom = Broom.new(broom_params)
    @broom.user = current_user
    if @broom.save
<<<<<<< HEAD
      redirect_to brooms_path, notice: 'Broom was successfully created.'
=======
      redirect_to broom_path(@broom)
>>>>>>> b6c3193c7044009445e08264ab5f414c0ce354e2
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def broom_params
    params.require(:broom).permit(:name, :description, :photo, :price)
  end
end
