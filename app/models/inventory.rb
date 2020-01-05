class Inventory < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cost, presence: true, numericality: true
  validates :price, presence: true, numericality: true
end
