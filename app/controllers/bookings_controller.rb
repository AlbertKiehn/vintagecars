class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :toogle_confirmed]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = Car.find(params[:car_id])
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
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
    params.require(:booking).permit(:start_date, :end_date, :car, :user)
  end
end
