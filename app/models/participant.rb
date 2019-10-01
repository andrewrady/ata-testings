class Participant < ApplicationRecord
  belongs_to :testing
  belongs_to :student

  serialize :categories

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :categories, presence: true
  validates :testing_id, presence: true
  validates :student_id, presence: true
end
