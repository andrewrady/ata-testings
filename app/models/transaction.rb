class Transaction < ApplicationRecord
  belongs_to :student
  has_many :transaction_item

  validates :total, presence: true
  validates :tax, presence: true
  validates :discount, presence: true
end
