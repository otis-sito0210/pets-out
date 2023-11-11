class Pet < ApplicationRecord
  belongs_to :user

  validates :size, presence: true
  validates :breed, presence: true
  validates :details, presence: true
end
