class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_broom

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(booking_param)
  end

  def create
    @booking = Booking.new(booking_param)
    @booking.broom = @broom
    if @booking.save
      redirect_to booking_path(@broom)
    else
      render :new
    end
  end

  def owner_bookings
    @owner_brooms = Broom.where(user: current_user)
    @owner_bookings = @owner_brooms.map do |owner_broom|
      owner_broom.bookings.where(status: "pending")
    end.flatten
  end

  def renter_bookings
    @bookings = current_user.bookings
  end

  def accept_booking
    if @booking.update(status: "accepted")
      redirect_to owner_bookings_path, notice: 'The broom’s owner accepted your request.'
    else
      redirect_to owner_bookings_path, alert: 'The request was declined.'
    end
  end

  def decline_booking
    if @booking.update(status: "declined")
      redirect_to owner_bookings_path, notice: 'Booking request declined.'
    else
      redirect_to owner_bookings_path, alert: 'Failed to decline booking request'
    end
  end

  private

  def set_broom
    @broom = Broom.find(params[:broom_id])
  end

  def booking_param
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :broom_id)
  end
end
