require 'rails_helper'

RSpec.describe Participant, type: :model do
  before(:each) do
    User.create(:email => 'test1@gmail.com', :password => 'password')
  end
  context 'validates participant creatation' do
    it 'ensures first name presense' do
      participant = Participant.new
      participant.lastName = 'Last'
      participant.valid?
      expect(participant.errors[:firstName]).to include("can't be blank")
    end

    it 'ensures last name presense' do
      participant = Participant.new
      participant.firstName = 'First'
      participant.valid?
      expect(participant.errors[:lastName]).to include("can't be blank")
    end

    it 'ensures categories presense' do
      participant = Participant.new
      participant.firstName = 'First'
      participant.lastName = 'Last'
      participant.valid?
      expect(participant.errors[:categories]).to include("can't be blank")
    end

    it 'ensures categories presense' do
      participant = Participant.new
      participant.firstName = 'First'
      participant.lastName = 'Last'
      participant.valid?
      expect(participant.errors[:testing_id]).to include("can't be blank")
    end

    it 'ensures categories presense' do
      participant = Participant.new
      participant.firstName = 'First'
      participant.lastName = 'Last'
      participant.valid?
      expect(participant.errors[:student_id]).to include("can't be blank")
    end
  end
end
