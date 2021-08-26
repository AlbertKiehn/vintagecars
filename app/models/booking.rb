class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :confirmation,
            :inclusion => { :in => [true, false] }
end
