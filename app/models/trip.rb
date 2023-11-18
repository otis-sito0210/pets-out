class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_many :appointments
  has_many :cities, through: :places
end
