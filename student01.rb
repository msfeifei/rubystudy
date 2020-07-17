#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'rubygems'
require 'JSON'
require 'HTTParty'
require 'pp'
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
students = HTTParty.get("https://faria.openapply.com/api/v3/students?access_token=#{TOKEN}&per_page=10", format: :plain)
JSON.parse students, symbolize_names: true
obj = JSON.parse students
puts obj.class
ss = obj["students"]


puts ss.class
for i in ss do
    puts i["id"]
    payments = HTTParty.get("https://faria.openapply.com/api/v3/students/#{i["id"]}/payments?access_token=#{TOKEN}", format: :plain)
    JSON.parse payments, symbolize_names: true
    puts payments

end



#parents = obj["payments"]
#puts parents



    
#students = HTTParty.get("https://faria.openapply.com/api/v3/students/{id}/payments?access_token=#{TOKEN}", format: :plain)