class Pet < ApplicationRecord
  belongs_to :user

  validates :size, presence: true
  validates :breed, presence: true
  validates :details, presence: true

  has_one_attached :photo
end
