class Participant < ApplicationRecord
  belongs_to :testing
  belongs_to :student
end
