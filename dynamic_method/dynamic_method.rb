class String_child < String
	def exclude? var
		if self.include?(var)
			puts "false"
		else
			puts "true"
		end
	end
	def to_upcase
		puts self.upcase
	end
end
puts "enter object to create for class String_child"
str1 = gets.chomp
obj = eval "#{str1}"
puts "functions: exclude?(arg), to_upcase"
puts "enter ur choice :"
str = gets.chomp
obj.instance_eval{ eval str}