require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
  end
  context 'validation student creatation' do
    it 'ensures first name presence' do
      student = Student.new
      student.lastName = 'lLast'
      student.user_id = User.first.id
      student.valid?
      expect(student.errors[:firstName]).to include("can't be blank")
    end

    it  'ensures last name prsence' do
      student = Student.new
      student.firstName = 'First'
      student.user_id = User.first.id
      student.valid?
      expect(student.errors[:lastName]).to include("can't be blank")
    end

    it 'saves successfully' do
      expect(Student.create!(:firstName => 'First', :lastName => 'Last', :user_id => 1)).to be_valid
    end
  end
end
 