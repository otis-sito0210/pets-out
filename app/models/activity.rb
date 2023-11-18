class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  has_many :appointments

  has_many :meetings
end
