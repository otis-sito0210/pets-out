class Meeting < ApplicationRecord
  belongs_to :activity, foreign_key: 'activity_id'
  belongs_to :user
end
