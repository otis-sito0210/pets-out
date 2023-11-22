class Place < ApplicationRecord
  belongs_to :user
  belongs_to :city

  has_one_attached :photo

end
