class Appointment < ApplicationRecord
  belongs_to :activity

  has_many :trips
end
