class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :model, :description, presence: true

  def self.search params
    cars = Car.where(model_id: params[:model].to_i) unless params[:model].blank?
    cars
  end
end
