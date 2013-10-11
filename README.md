### Tabata

A little ruby script to help me figure out timing of my Tabata invterval
sets. Useful to anyone else? Unlikely.

#### Use

Say you want to break up your 8 Tabata intervals into 3 sets of 3, 2, 3

    tabata_sets = [3,2,3].map {|c| TabataSet.new(c)}

Then you want rest 45 seconds between each set. And you've got 60
seconds of warmup before you start your first set:

    rest_period = 45
    warmup_period = 60
    Workout.new(tabata_sets, warmup_period, rest_period, Stopwatch.new)

You'll see in response:

    Start at 01:00
    Do 3 sets until 02:30
    Rest for 45 until 03:15
    Do 2 sets until 04:15
    Rest for 45 until 05:00
    Do 3 sets until 06:30
    Rest for 45 until 07:15
