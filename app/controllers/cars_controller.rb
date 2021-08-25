class CarsController < ApplicationController
  def index
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

  private

  def cars_params
    params.require(:car).permit(:name, :model, :description).with_defaults(user_id: current_user.id)
  end
end
