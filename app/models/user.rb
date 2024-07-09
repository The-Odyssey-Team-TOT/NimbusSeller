class User < ApplicationRecord
  has_many :brooms
  has_many :bookings
  validates :username, :password, presence: true
end
