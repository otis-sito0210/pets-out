class Appointment < ApplicationRecord
  belongs_to :activity
  belongs_to :trip

  validates :date, presence: true
  validates :hour, presence: true
end
