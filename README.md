### Tabata

A little ruby script to help me figure out timing of my Tabata invterval
sets. Useful to anyone else? Unlikely.

#### Use

First you need a Tabata Interval. The standard is 20 seconds of full
effort followed by 10 seconds of light effort.

    tabata_interval = TabataInterval.new(20,10)

Say you want to break up your 8 Tabata intervals into 3 sets of 3, 2, 3

    tabata_sets = [3,2,3].map {|c| TabataSet.new(c, tabata_interval)}

Then you want rest 45 seconds between each set. And you've got 60
seconds of warmup before you start your first set:

    rest_period = 45
    warmup_period = 60
    Workout.new(tabata_sets, warmup_period, rest_period, Stopwatch.new)

You'll see in response:

    Start at 01:00
    Heavy to 01:20
    Light to 01:30
    Heavy to 01:50
    Light to 02:00
    Heavy to 02:20
    Light to 02:30
    Rest for 45 until 03:15
    Heavy to 03:35
    Light to 03:45
    Heavy to 04:05
    Light to 04:15
    Rest for 45 until 05:00
    Heavy to 05:20
    Light to 05:30
    Heavy to 05:50
    Light to 06:00
    Heavy to 06:20
    Light to 06:30
    Rest for 45 until 07:15
