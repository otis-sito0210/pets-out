class City < ApplicationRecord
  has_many :places
  has_many :activities

  has_one_attached :photo
end
