class PosRecord < ApplicationRecord
  belongs_to :student
  has_many :items

  validates :total, presence: true

end
