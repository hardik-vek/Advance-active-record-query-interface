# frozen_string_literal: true
class Order < ApplicationRecord
    validates :quantity, :status, presence: true
    enum :status, [:booked, :cancelled]
    belongs_to :product
    belongs_to :customer
end

