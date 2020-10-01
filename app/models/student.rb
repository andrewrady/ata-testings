class Student < ApplicationRecord
  belongs_to :user
  has_many :ranks, -> { order(created_at: :asc) }, :dependent => :destroy
  has_many :pos_records
  has_many :addresses, :dependent => :destroy
  has_many :email_addresses, :dependent => :destroy

  validates :firstName, presence: true
  validates :lastName, presence: true

  accepts_nested_attributes_for :ranks
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :email_addresses

end
