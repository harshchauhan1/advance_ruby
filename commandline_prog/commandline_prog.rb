if __FILE__ == $0
  @str = "new_func"
  @str1 = "puts 'hello'"
end
class Dynamic_func
	def initialize var
		self.class.calling(var)
	end
	def self.calling var1
		define_method("#{var1}") {|i| eval i}
	end
end
obj = Dynamic_func.new(@str)
obj.send(@str, @str1)