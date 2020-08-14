class Calculator
    def sum(number, other)
        number + other
    end
end

calculator = Calculator.new
p calculator

p calculator.class

p calculator.is_a?(Calculator)

calculator = Calculator.new
puts calculator.sum(2, 3)

class Person
    def initialize(name)
        @name = name
    end

    def name
        @name
    end 

    def password=(password)
        @password = password
    end

    def greet(other)
        puts "Hi " + other.name + "! My name is " + name + "!"
    end
end
person = Person.new('Ada')
friend = Person.new('Carla')
puts person.name

person.greet(friend)
person.password=('super secret')
p person

