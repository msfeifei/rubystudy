#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'JSON'
require 'FARADAY'
require 'CSV'
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
response = Faraday.get("https://faria.openapply.cn/api/v1/students?auth_token=#{TOKEN}&per_page=10")
puts response
JSON.parse (response.body),symbolize_names: true # 解析JSON字符串
info = JSON.parse (response.body)   #所有的信息
puts info.class
stud = info["students"]
# puts stud    # 学生的信息
column_name = stud.first.keys
  # 散列的第一个列
CSV.open("/Users/feifeiwang/Documents/file.csv", "wb") do |csv|
    csv << column_name
    stud.each do |x|            #遍历values值
    csv << x.values
    end
end