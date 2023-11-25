class Pet < ApplicationRecord
  belongs_to :user

  validates :size, presence: true
  validates :breed, presence: true
  validates :details, presence: true
  validates :photo, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true

  has_one_attached :photo
end
