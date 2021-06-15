class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakout_hash = Hash.new(0)
    array_of_hashes = @activities.map do |activity|
      activity.owed
    end
    breakout = array_of_hashes.flat_map do |hash|
      hash.each_with_object(breakout_hash) do |(person, cost), hash|
        hash[person] += cost
      end
    end
    breakout[0]
  end
end
