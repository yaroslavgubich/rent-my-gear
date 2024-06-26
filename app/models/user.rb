class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gears, dependent: :destroy
  has_many :bookings, dependent: :destroy
end

class Gear < ApplicationRecord
  belongs_to :user
end
