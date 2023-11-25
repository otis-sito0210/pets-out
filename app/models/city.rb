class City < ApplicationRecord
  has_many :places
  has_many :activities

  has_one_attached :photo

  validates :local, presence: true, uniqueness: true
  validates :photo, presence: true
end
