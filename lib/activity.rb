class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person, cost)
    @participants[person] = cost
  end

  def total_cost
    @participants.sum do |person, cost|
      cost
    end
  end

  def split
    total_cost / @participants.keys.length
  end

  def owed
    unchanged_split = split
    owed_hash = @participants.each do |person, cost|
      @participants[person] = (unchanged_split - cost)
    end
    owed_hash
  end
end
