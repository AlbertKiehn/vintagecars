class Booking < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :cars, through: :bookings

  validates :start_date, :end_date, presence: true
end
