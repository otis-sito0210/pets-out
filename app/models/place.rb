class Place < ApplicationRecord
  belongs_to :user
  belongs_to :city

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  after_validation :debug_geocode

  def debug_geocode
    Rails.logger.debug("Geocoding Place ID #{id}, address: #{address}")
    result = geocode
    Rails.logger.debug("Geocoding result: #{result.inspect}")
  end

end
