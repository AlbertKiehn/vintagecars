class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :model, :description, presence: true
end
