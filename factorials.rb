#!/usr/bin/ruby

print "Enter any number: "
STDOUT.flush
number = gets.chomp

def factorial(number)
	if number == 0
		1
	else 
		number*factorial(number-1)
	end
end

print "factorial result: #{factorial(number.to_i)}\n"