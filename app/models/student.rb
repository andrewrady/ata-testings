class Student < ApplicationRecord
  belongs_to :user

  validates :firstName, presence: true
  validates :lastName, presence: true
end
