require 'rails_helper'

RSpec.describe Testing, type: :model do
  before(:each) do
    User.create(:email => 'test1@gmail.com', :password => 'password')
  end

  context 'test validations' do
    it 'ensure location presence' do
      testing = Testing.new
      testing.date = '11/12/2019'
      testing.user_id = User.first.id
      testing.valid?
      expect(testing.errors[:location]).to include("can't be blank")
    end

    it 'ensure date presence' do
      testing = Testing.new
      testing.location = 'Boise'
      testing.user_id = User.first.id
      testing.valid?
      expect(testing.errors[:date]).to include("can't be blank")
    end

    it 'save successfully' do
      expect(Testing.create!(:location => 'Boise', :date => '11/12/2019', :status => true, :user_id =>  User.first.id)).to be_valid
    end
  end
end
