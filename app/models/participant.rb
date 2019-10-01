class Participant < ApplicationRecord
  belongs_to :testing
  belongs_to :student

  serialize :categories

  validates :firstName, presense: true
  validates :lastName, presense: true
  validates :categories, presense: true
  validates :testing_id, presense: true
  validates :student_id, presense: true
end
