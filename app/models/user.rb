class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :role, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "Must be a valid email." }

  has_many :orders
end
