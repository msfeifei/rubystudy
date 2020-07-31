#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'JSON'
require 'FARADAY'
require 'CSV'
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
response = Faraday.get("https://faria.openapply.cn/api/v1/students?auth_token=#{TOKEN}&per_page=10")
puts response   #将返回一个 “#<Faraday::Response:0x00007fdea703df58>“带有响应状态，标头和正文的对象
# puts response.status  # =>响应状态 200
# puts response.headers  # => 标头
# puts response.body   # => 正文
JSON.parse (response.body),symbolize_names: true # 解析JSON字符串
info = JSON.parse (response.body)   #所有的信息
puts info.class
stud = info["students"]
# puts stud    # 学生的信息
file = File.open(File.join("/Users/feifeiwang/Documents","faraday.csv"),"w+")
column_name = stud.first.keys
  # 散列的第一个列
s=CSV.generate do |csv|
  csv << column_name
  stud.each do |x|            #遍历values值
    csv << x.values
  end
end
#f.colse
File.write(file, s)        #把s写入到f（文件）里面
file.close