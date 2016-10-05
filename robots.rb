#!/usr/bin/env ruby

require 'erb'

class Robot
  attr_accessor :name,
                :height

  def initialize(unit_name="001", height="10")
    @name = unit_name
    @height = height
  end

  def to_s
    @name
  end

  def say_hi
    "Hi!"
  end

  def say_name
    "My name is #{@name}"
  end

end

class BendingUnit < Robot

  def initialize(unit_name="001-B")
    @name = unit_name
  end

  def bend(object_to_bend)
    "Bend #{object_to_bend}!"
  end

end

class ActorUnit < Robot

  def change_name(new_name)
    @name = new_name
  end

end

new_bender = BendingUnit.new(ARGV[0])
unbent_thing = ARGV[1]

#Adventure Mode

def upgrade(group)
  group.collect { |human| Robot.new("#{human} v2.0")}
end

our_class = %w(Luiz Zachary Chris Brent Keith Michael Jon)

new_class = upgrade(our_class)

# new_class = our_class.collect{|human| Robot.new("#{human} v2.0")}

puts new_class

#
# new_class.each {|robot| puts robot.height}
#
def robot_roll_call(group)
  group.each { |member| puts "#{member}, here!"}
end

robot_roll_call(new_class)

new_class.each {|robot| puts "I am #{robot.height} units tall."}

new_file = File.open("./#{ARGV[0]}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
