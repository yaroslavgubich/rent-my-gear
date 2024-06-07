class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :price_per_day, :category, :availability, presence: true
  # added this line so if the gear is owned by the user he cannot book it and he see the delete and edit
  def owned_by?(user)
    self.user == user
  end

end
