class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_broom, except: [:index, :show, :owner_bookings, :renter_bookings]

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
    @booking.user = current_user
    @booking.status = 'pending'
    if @booking.save
      redirect_to bookings_renter_path
    else
      render 'brooms/show', alert: 'Sorry, booking failed.'
    end
  end

  def owner_bookings
    @owner_brooms = Broom.where(user: current_user)
    @owner_bookings = @owner_brooms.map do |owner_broom|
      owner_broom.bookings.where(status: "Pending")
    end.flatten
  end

  def renter_bookings
    @renter_bookings = current_user.bookings
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
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
