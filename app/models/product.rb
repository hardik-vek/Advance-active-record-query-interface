# frozen_string_literal: true
class Product < ApplicationRecord
  validates :title, :description, :price, :capacity, :status, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 300 }
  enum :status, [:in_stock, :out_of_stock, :coming_soon]
  default_scope { where("is_active = ?", true) }
  has_many :orders, dependent: :destroy
end

