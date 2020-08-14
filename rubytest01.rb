#!/usr/bin/ruby -w

print "Hello Word, use print";
puts "Hello Word, use puts";

puts "你好，世界！"
puts "wwwwniuniu"

(10..15).each do |n|
    print n, ' '
end

hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
    print key, ':', value, "\n"
end

