def calculator (var1, op, var2)
   puts [var2].inject(var1, op)
end
puts "enter first operand"
var1 = gets.chomp
puts "enter second operand"
var2 = gets.chomp
puts "enter operator"
op = gets.chomp
calculator var1.to_f,op.to_sym,var2.to_f
