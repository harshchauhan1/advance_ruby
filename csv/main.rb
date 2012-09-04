puts "enter file name : menu  OR  places"
file_name = gets.chomp
i = 0
n = 0
obj = []
data = []
names = []
 File.open(file_name + ".txt", "r").each_line do |line|
  line.chomp!
 	values = line.split(",")
 	if (i == 0) 
    names = values
    Dynamic = Object.const_set(file_name.capitalize.to_sym, Class.new do 
 		 values.each do |func_name| 
 			  define_method ("read_#{func_name}") { |var| instance_variable_set("@#{func_name}", var) }
 			  define_method ("display_#{func_name}") { puts " #{func_name} : #{instance_variable_get("@#{func_name}")}" }
 		 end
 	  end)
  else 
    obj[i-1] = Dynamic.new
    data[i-1] = line
 	end
  i = i + 1
end
for j in 0..data.length-1
  names.each do |func|
    obj[j].send("read_"+func, data[j].split(",")[n])
    n = n + 1
  end
  n = 0
end

for j in 0..data.length-1
  names.each do |func|
    obj[j].send("display_"+func)
    n = n + 1
  end
  puts "\n"
  n = 0
end