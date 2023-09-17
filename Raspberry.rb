class Raspberry

  @@stages = ["Absent", "Flowering", "Green", "Red"]

  def initialize(index)
    @index = index
    @stages = @@stages[0]
  end

  def grow!
    current_index = @@stages.index(@stages)
    if current_index < @@stages.length - 1
      @stages = @@stages[current_index + 1]
    end
  end

def ripe?
  @stages == "Red"
end
end

#--------------------------------RASPBERRY BUSH-CLASS----------------------------
class RaspberryBush

  def initialize(num_raspberries)
    @raspberries =[]
    num_raspberries.times {|i|@raspberries << Raspberry.new(i)}
  end

  def grow_all!
    @raspberries.each{|raspberries| raspberries.grow!}
  end

  def ripe_all?
    @raspberries.all?{|raspberries| raspberries.ripe?}
  end

  def give_away_all!
    @raspberries.clear
  end
end

#----------------------HUMAN CLASS---------------------------------------
class Human
  attr_accessor :name

  def initialize(name, raspberry_bush)
    @name = name
    @plant = raspberry_bush
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      puts "Congratulations you won!"
      @plant.give_away_all!

    else
      puts "It's too early #{@name}, be patient!"
    end
  end

  def self.knowledge_base
    puts "Gardening tip: aspberries are best planted in
    early spring or late fall for optimal growth"
    puts "Plant raspberries in well-drained soil and full sun."
  end
end

#-------------------CONSOLE OUTPUT-------------------

puts "What is your name ?"
name = gets.chomp
gardener = Human.new(name, RaspberryBush.new(50))

puts "Okay, #{name}. Here is the backgroud: you have 50 raspberry bushes."
puts "You can enter: "
puts "1. To harvest raspberries if they are ripe"
puts "2. To work and grow your plants"
puts "3. To know your knowledge base"
puts " "

loop do
  choice = gets.chomp.to_i
  case choice
  when 1
    result = gardener.harvest
    puts result
    break if  result == "Congratulations you won!"

  when 2
    gardener.work!
    puts "Good job! Keep going! "

    when 3
      puts Human.knowledge_base
       else
        puts "Invalid choice"
  end
end
