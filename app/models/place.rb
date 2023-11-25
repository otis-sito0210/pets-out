class Place < ApplicationRecord
  belongs_to :user
  belongs_to :city

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :address, presence: true
  validates :pricing, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rooms, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :details, presence: true

end
