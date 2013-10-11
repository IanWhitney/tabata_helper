TabataSet = Struct.new(:count) do
  def duration
    count * 30
  end
end

class Stopwatch
  attr_accessor :location

  def initialize()
    self.location = 0
  end

  def to_minutes()
    Time.at(location).strftime("%M:%S")
  end

  def advance(s)
    self.location += s
    self
  end
end

class Workout
  def initialize(sets, warm_up_time, rest_period, stopwatch)
    stopwatch.advance(warm_up_time)

    puts "Start at #{stopwatch.to_minutes}"

    sets.each do |set|
      puts "Do #{set.count} sets until #{stopwatch.advance(set.duration).to_minutes}"
      puts "Rest for #{rest_period} until #{stopwatch.advance(rest_period).to_minutes}"
    end
  end
end

tabata_sets = [3,2,3].map {|c| TabataSet.new(c)}
Workout.new(tabata_sets, 60, 45, Stopwatch.new)
