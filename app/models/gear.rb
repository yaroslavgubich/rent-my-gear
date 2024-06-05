class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :description, :price_per_day, :category, :availability, presence: true
end
