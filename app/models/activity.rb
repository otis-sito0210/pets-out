class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  has_many :appointments
  has_many :meetings

  has_one_attached :photo

  validates :details, presence: true
  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :address, presence: true
  validates :photo, presence: true
end
