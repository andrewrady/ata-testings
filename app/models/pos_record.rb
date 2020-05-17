class PosRecord < ApplicationRecord
  belongs_to :student
  has_many :pos_record_items

  validates :total, presence: true

end
