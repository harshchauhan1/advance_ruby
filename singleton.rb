str = String.new("harsh")
class << str
	def name 
		puts "#{self}"
	end
end
def str.name1
	puts "#{self}"
end
str.name
str.name1
"akshay".name
"akshay".name1