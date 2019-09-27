class Testing < ApplicationRecord
  belongs_to :user
  has_many :participants

  accepts_nested_attributes_for :participants, allow_destroy: true
end
