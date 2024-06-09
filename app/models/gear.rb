class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, :description, :price_per_day, :category, :availability, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0 }
end
