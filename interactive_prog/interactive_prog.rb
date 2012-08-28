if __FILE__ == $0
  @str = "puts 'hello'"
  @str1 = ""
end
def interact string1,string2
	if (string1 == "")
		eval string2
	else 
		if string1 == 'q'
			return
		end
		
	end
end
interact(@str1,@str)