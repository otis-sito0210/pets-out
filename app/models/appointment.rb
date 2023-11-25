class Appointment < ApplicationRecord
  belongs_to :activity
  has_many :trips

  validates :date, presence: true
  validates :hour, presence: true
end
