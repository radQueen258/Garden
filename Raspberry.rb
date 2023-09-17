class Raspberry

  attr_reader :index, :stages

  def self.stages
    @@stages = ["Absent", "Flowering", "Green", "Red"]
  end

  def initialize(index)
    @index = 0
    @stages = @@stages[index]
  end

  def grow!
    @index += 1
    @stages[@index]
  end

  def ripe? (raspberries)
    @@stages.index(raspberries.last) == @@stages.index("Red")
  end
end


class RaspberryBush

  def initialize(num_raspberries)
    Raspberry.stages
    @raspberries =[]
    num_raspberries.times {@raspberries << Raspberry.new}
  end

  def grow_all!
    @raspberries.each(&:grow!)
  end

  def ripe_all?
    @raspberries.all?(&:ripe?)
  end

  def give_away_all!
    @raspberries.clear
  end
end

class Human
  attr_accessor :name

  def initialize(name, plant)
    @name = name
    @plant = plant
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      puts "Harvesting time!!"
      @plant.give_away_all!

    else
      puts "It's too early, be patient!"
    end
  end

  def self.knowledge_base
    puts "Gardening tip: aspberries are best planted in
    early spring or late fall for optimal growth"
  end
end



require_relative 'raspberry_bush'
require_relative 'human'

def call_for_help
  puts "Calling for help with gardening..."
end

raspberry_bush = RaspberryBush.new(4)
human = Human.new ("Alice")

human.take_care_of(raspberry_bush)

while !raspberry_bush.ripe?
  puts "The raspberries are not yet ripe, continuing to care for them..."
  human.take_care_of(raspberry_bush)
end

puts "Harvesting..."

harvest = human.harvest(raspberry_bush)
if harvest.empty?
  call_for_help
end
puts "Harvest #{harvest.size} raspberries"
