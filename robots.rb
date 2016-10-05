#!/usr/bin/env ruby

require 'erb'

class Robot
  attr_accessor :name

  def initialize(unit_name="001")
    @name = unit_name
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

new_file = File.open("./#{ARGV[0]}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
