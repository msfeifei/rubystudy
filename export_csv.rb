#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'rubygems'
require 'JSON'
require 'HTTParty'
require 'pp'
require 'dotenv'
require 'csv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
students = HTTParty.get("https://faria.openapply.com/api/v3/students?access_token=#{TOKEN}&per_page=10", format: :plain)
JSON.parse students, symbolize_names: true
obj = JSON.parse students
puts obj.class #hash
ss = obj["students"]
puts ss
#ss.each do |key, value|
    #puts key
#puts value
#end

#CSV.open("ss04.csv", "a+") do |csv|
    #csv << ss.keys
    #csv << ss.values
#end

column_names = ss.first.keys
s=CSV.generate do |csv|
  csv << column_names
  ss.each do |x|
    csv << x.values
  end
end
File.write('the_file01.csv', s)








