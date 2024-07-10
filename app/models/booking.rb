class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :broom

  STATUS = %w[accepted declined pending]
  validates :status, inclusion: { in: STATUS }
end
