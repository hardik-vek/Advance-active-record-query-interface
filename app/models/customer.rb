# frozen_string_literal: true
class Customer < ApplicationRecord
  validates :fname, :lname, :email, :phone_number, presence: true
  validates :email, uniqueness: true
  validates :fname, :lname, length: { minimum: 2, maximum: 30 }
  validates :phone_number, length: { is: 10 }
  has_many :orders, dependent: :destroy
end

