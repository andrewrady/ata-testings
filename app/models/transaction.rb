class Transaction < ApplicationRecord
  belongs_to :student
  has_many :transaction_items

  validates :total, presence: true
end
