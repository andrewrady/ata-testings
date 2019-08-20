class Participant < ApplicationRecord
  belongs_to :testing
  belongs_to :student

  serialize :categories
end
