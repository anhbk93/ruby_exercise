require_relative 'product'

$arr_products = []
$new_arr_products = []
$free_basic_tax_list = ["food","book","medicine"]

def increase_product_fee products_list
	products_list.each do |product|
		plus_basic_tax(product) if product.is_not_free_basic_tax?($free_basic_tax_list);
		plus_import_tax(product) if product.is_import_tax?
		$new_arr_products<<product.round
	end
end


def print_star
	puts "***************************************************"
end
def plus_basic_tax product
	product.price *= 1.01 
end

def plus_import_tax product
	product.price *= 1.005
end

def count_sum_of_fee products_list
	sum  = 0
	products_list.map {|product| sum += product.amount*product.price}
	sum
end

def print_table_product arr_product
	print "Number\tProduct\t\t\t\t\tPrice\n"
	arr_product.each { |product| puts product.description }
end

#main

def get_data_from_file file_name
	data_rows = IO.readlines(file_name)
	product_arr = []
	data_rows.each { |row| product_arr<<row.to_s.chomp.split("---") }
	product_arr.each { |word| $arr_products << Product.new(word.shift.to_i,word.shift,word.shift.to_i) }
end

get_data_from_file ("input_products.txt")
sum_before = count_sum_of_fee($arr_products)
puts "List of product input :"
print_table_product $arr_products
print_star
puts "List of product output :"
increase_product_fee $arr_products
print_table_product $arr_products
print_star
sum_after = count_sum_of_fee $new_arr_products
sum_tax = sum_after - sum_before


puts "Sum of tax: #{sum_tax}"
puts "Sum of fee: #{sum_after}"
