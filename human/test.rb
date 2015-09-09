require_relative 'human'


$arr_human = []
$AGE_LIMIT = 18 


def find_gender arr_person, gender 
	 arr_person.select { |person| person.gender.downcase == gender.downcase }
end

def find_persons_under_age arr_person, age
	arr_person.select { |person| person.age < $AGE_LIMIT }
end

def find_persons_bigger_age arr_person, age
	arr_person.select { |person| person.age >= $AGE_LIMIT }
end

def display_infor arr_person
	arr_person.each { |person| puts person.description } 
end

def input_data
	while true
		print "Input name of person: "
		name = gets.chomp
		if name.strip.length == 0
			puts "Invalid name! Name must be diffirent \"\""
		else
			break
		end
	end
	while true
		print "Input age of this person: "
		age = gets.chomp.to_i

		if (age.is_a? Integer) && (age >= 0 ) && (age <= 100)
			break
		else
			puts "Invalid age! Age must be an Integer and between 0 and 100!"
		end
	end
	while true
		print "Input gender of this person: "
		gender = gets.chomp

		if (gender.downcase == "male") || (gender.downcase == "female")
			break
		else
			puts "Invalid gender! Only \"male\" or \"female\"!"
		end	
	end
	$arr_human<< (Human.new name,age,gender)
end

def print_star
	puts "*******************************************"
end

# main
while true
	input_data
	puts "Do you want to continue?"
	puts "To continue add new person. Input : yes or y"
	puts "To exit and view result. Input : no or n"
	check = gets.chomp
	if check.downcase == "yes" || check.downcase == "y"
		
		puts "Keep going :))"
	else
		puts "Result:"
		break
	end
end

def check_amount list_person
	if (list_person.size > 0)
		display_infor list_person
	else
		puts "0"
	end
end

#display result
print_star
puts "List of female person in your list: "
list_female = find_gender $arr_human,"female"
check_amount list_female

puts "List of female person is younger #{$AGE_LIMIT} in your list: "
list_female_younger =  find_gender (find_persons_under_age $arr_human,$AGE_LIMIT), "female"
check_amount list_female_younger

puts "List of female person is older than #{$AGE_LIMIT} in your list: "
list_female_older = find_gender (find_persons_bigger_age $arr_human,$AGE_LIMIT), "female"
check_amount list_female_older

print_star
puts "List of male person in your list: "
list_male = find_gender $arr_human,"male"
check_amount list_male 

puts "List of male person is younger #{$AGE_LIMIT} in your list: "
list_male_younger = find_gender (find_persons_under_age $arr_human,$AGE_LIMIT), "male"
check_amount list_male_younger

puts "List of male person is older than #{$AGE_LIMIT} in your list: "
list_male_older = find_gender (find_persons_bigger_age $arr_human,$AGE_LIMIT), "male"
check_amount list_male_older




