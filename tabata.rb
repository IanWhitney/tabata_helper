TabataInterval = Struct.new(:full_effort, :light_effort)

TabataSet = Struct.new(:count, :interval) do
  def duration
    count * (interval.full_effort + interval.light_effort)
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
      set.count.times do |s|
        puts "Full to #{stopwatch.advance(set.interval.full_effort).to_minutes}"
        puts "Light to #{stopwatch.advance(set.interval.light_effort).to_minutes}"
      end
      puts "Rest for #{rest_period} until #{stopwatch.advance(rest_period).to_minutes}"
    end
  end
end

interval = TabataInterval.new(20,10)
tabata_sets = [3,2,3].map {|c| TabataSet.new(c, interval)}
Workout.new(tabata_sets, 60, 45, Stopwatch.new)
