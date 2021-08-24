class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :toogle_confirmed]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @car = @booking.car
    @user = @booking.user

    if @booking.save
      redirect_to '/bookings', notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
    @car = @booking.car
    @user = @booking.user
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id).with_defaults(user_id: current_user.id)
  end
end
