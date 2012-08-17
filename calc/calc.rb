def calculator var1, op, var2
   puts [var2].inject(var1, op)
end
calculator 2,:+,3