class Human
	attr_accessor :name,:age,:gender
	def initialize name,age,gender
		@name,@age,@gender = name,age,gender
	end
	def description
		"Name: #{@name}, age: #{@age}, gender: #{@gender}"
	end
	def is_valid? person
		return false if person.name.strip.length == 0
		return false if (person.gender.downcase != "male")|| (person.gender.downcase != "female")
		return false if !(person.age.is_a? Integer) && ( person.age < 0 ) && (person.age > 100)
		true
	end
	def age_checker? age
		return false if self.age > age
		true
	end
	def gender_checker? sex
		return false if ( (self.gender.downcase) != (sex.downcase))
		true
	end
end

