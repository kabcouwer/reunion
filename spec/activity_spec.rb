require 'rspec'
require './lib/activity'

RSpec.describe Activity do
  before :each do
    @activity = Activity.new("Brunch")
  end
  describe 'instantiation' do
    it 'exists' do
      expect(@activity).to be_an(Activity)
    end

    it 'has readable attributes' do
      expect(@activity.name).to eq("Brunch")
      expect(@activity.participants).to eq({})
    end
  end

  describe 'methods' do
    it 'can add participants' do
      @activity.add_participant("Maria", 20)

      expect(@activity.participants).to eq({"Maria" => 20})
      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)

      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
      expect(@activity.total_cost).to eq(60)
    end

    it 'can split the total_cost' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.split).to eq(30)
    end

    it 'can find what each person owes' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end

end
