class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates  :start_date, presence: true
  validates  :end_date, presence: true

  has_many :appointments
  has_many :cities, through: :places
end
