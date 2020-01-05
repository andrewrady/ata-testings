require 'rails_helper'

RSpec.describe AvailableRank, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context 'validation for available ranks' do
      it 'ensures name is present' do
        availableRank = AvailableRank.new
        availableRank.order = 1
        availableRank.valid?
        expect(availableRank.errors[:name]).to include("can't be blank")
      end

      it 'ensure order is present' do
        availableRank = AvailableRank.new
        availableRank.name = 'White'
        availableRank.valid?
        expect(availableRank.errors[:order]).to include("can't be blank")
      end

      it 'saves successfully' do
        expect(AvailableRank.create!(:name => "White", :order => 1))
      end

  end
end
