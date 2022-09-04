class User < ApplicationRecord
  validates :name, presence: true
  validates :role, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
