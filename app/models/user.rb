class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
<<<<<<< HEAD
  has_many :brooms
=======

  has_many :brooms
  has_many :bookings

>>>>>>> b6c3193c7044009445e08264ab5f414c0ce354e2
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
