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
    breakout_hash = Hash.new{ |hash, key| hash[key] = 0 }
    @activities.each do |activity|
      activity.owed.each do |person, cost|
        breakout_hash[person] += cost
      end
    end
    breakout_hash
  end


# array_of_hashes = @activities.map do |activity|
#   activity.owed
# end
# breakout = array_of_hashes.flat_map do |hash|
#   hash.each_with_object(breakout_hash) do |(person, cost), hash|
#     hash[person] += cost
#   end
# end
# breakout[0]
  def summary
    string = ''
    sum_array = breakout.sort_by do |person, cost|
      person
    end.reverse
    sum_array.each do |array|
      string << (array[0] + ': ' + array[1].to_s + "\n")
    end
    string.chop
  end
end
