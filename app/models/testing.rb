class Testing < ApplicationRecord
  has_many :participants

  accepts_nested_attributes_for :participants, allow_destroy: true
end
