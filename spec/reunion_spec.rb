require 'rspec'
require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  before :each do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
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

    it 'can find reunion total cost' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @reunion.add_activity(@activity_1)

      expect(@reunion.total_cost).to eq(60)

      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
      @reunion.add_activity(@activity_2)

      expect(@reunion.total_cost).to eq(180)
    end

    it 'can find breakout' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @reunion.add_activity(@activity_1)
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
      @reunion.add_activity(@activity_2)

      expect(@reunion.breakout).to eq({
        "Maria" => -10,
        "Luther" => -30,
        "Louis" => 40
        })
    end

    it 'can create a summary' do
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @reunion.add_activity(@activity_1)
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
      @reunion.add_activity(@activity_2)

      expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
    end
  end
end
