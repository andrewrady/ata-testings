class Testing < ApplicationRecord
  belongs_to :user
  has_many :participants

  validates :location, presence: true
  validates :date, presence: true

  accepts_nested_attributes_for :participants, allow_destroy: true
end
