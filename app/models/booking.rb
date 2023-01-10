class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :starts_at, :ends_at, presence: true
end
