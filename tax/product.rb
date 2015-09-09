class Product
	
	attr_accessor :amount,:name,:price

	def initialize amount,name,price
		@amount,@name,@price = amount,name,price
	end

	def is_not_free_basic_tax? free_basic_tax_list
		free_basic_tax_list.each { |key| return false if (self.name.downcase.include?(key.downcase)) }
		true
	end

	def is_import_tax?
		(self.name.downcase.start_with?("import"))? true:false
	end

	def description
		"#{@amount}\t\t#{@name}\t\t\t\t\t$#{@price}\n"
	end

	def round
		self.price = self.price.round(2) 
		self
	end

end

# print Product.new(2,"Sex toy",20).description