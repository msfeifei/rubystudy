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
#puts stud    # 学生的信息

#puts stud['id']

puts stud.class #Array
column_name = stud.first.keys
  # 散列的第一个列
CSV.open("/Users/feifeiwang/Documents/feifei01.csv", "wb") do |csv| #use CSV to save as csv file. 
    csv << column_name
    stud.each do |x|            #遍历values值
    csv << x.values
    end
end
class Student
    def initialize(first_name, last_name, gender, email) #class student have four attribute 
        @first_name = first_name #declare instance variable
        @last_name = last_name
        @gender = gender
        @email = email
    end

    def full_name #method
        #puts "名字为： #{@first_name}"
        #puts "姓： #{@last_name}"
        @first_name + ' ' + @last_name #return value
    end
end

stud.each do |s| #s means every data in Array
    #p "#{s['first_name']}, #{s['last_name']}"

    student = Student.new(s['first_name'], s['last_name'], s['gender'], s['email'])
    #p s.class #Hash
    p student.full_name
end

