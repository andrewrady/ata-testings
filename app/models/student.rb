class Student < ApplicationRecord
  belongs_to :user
  has_many :ranks, :dependent => :destroy

  validates :firstName, presence: true
  validates :lastName, presence: true

  accepts_nested_attributes_for :ranks
end