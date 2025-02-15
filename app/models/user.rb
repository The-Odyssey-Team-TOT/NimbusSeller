class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
