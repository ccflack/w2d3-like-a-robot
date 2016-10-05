#!/usr/bin/env ruby

require 'erb'

class Robot





new_file = File.open("./#######.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
