class Human

	attr_accessor :name,:age,:gender

	def initialize name,age,gender
		@name,@age,@gender = name,age,gender
	end

	def description
		"Name: #{@name}, age: #{@age}, gender: #{@gender}"
	end
	
end

