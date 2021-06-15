require 'rspec'
require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  before :each do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end
  describe 'instantiation' do
    it 'exists' do
      expect(@reunion).to be_an(Reunion)
    end

    it 'has readable attributes' do
      expect(@reunion.name).to eq("1406 BE")
      expect(@reunion.activities).to eq([])
    end
  end

  describe 'methods' do
    it 'can add activity' do
      @reunion.add_activity(@activity_1)

      expect(@reunion.activities).to eq([@activity_1])
    end
  end
end
