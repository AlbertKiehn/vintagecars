class Booking < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  belongs_to :car
=======
  belongs_to :car
  belongs_to :user
>>>>>>> master

  validates :start_date, :end_date, presence: true
end
