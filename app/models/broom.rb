class Broom < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
=======
  has_many :bookings
  has_one_attached :photo

>>>>>>> b6c3193c7044009445e08264ab5f414c0ce354e2
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true
end
