class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def mybookings
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

  def edit; end

  Cloudinary.config do |config|
    config.cloud_name = 'mk01'
    config.api_key = '243339615997478'
    config.api_secret = 'YEyzNmKecdmScbJTs5wcY3KFlO8'
    config.secure = true
    config.cdn_subdomain = true
  end

  def update
    @booking.update(confirmation: true)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to bookings_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car, :user)
  end
end
