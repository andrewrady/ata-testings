require 'rails_helper'

RSpec.describe Participant, type: :model do
  before(:each) do
    User.create(:email => 'test1@gmail.com', :password => 'password')
  end
  context 'validates participant creatation' do
    it 'ensures first name presense' do
      participant = Participant.new
      participant.lastName = 'Last'
      participant
    end
  end
end
