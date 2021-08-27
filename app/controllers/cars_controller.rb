class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def display
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def search
    @cars = Car.search(cars_params)
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(cars_params)
    @car.user = current_user
    if @car.save
      redirect_to "/cars", notice: "car was succesfully created"
    else
      render :new
    end
  end
  Cloudinary.config do |config|
    config.cloud_name = 'mk01'
    config.api_key = '243339615997478'
    config.api_secret = 'YEyzNmKecdmScbJTs5wcY3KFlO8'
    config.secure = true
    config.cdn_subdomain = true
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.user == current_user
      @car.destroy
      redirect_to "/cars", notice: " * your offer has been taken down! * "
    else
      redirect_to "/cars", notice: " * action failed * you little twat, you are not the owner of this car *"
    end
  end

  private

  def cars_params
    params.require(:car).permit(:name, :model, :description, :photo, :user).with_defaults(user_id: current_user.id)
  end
end
