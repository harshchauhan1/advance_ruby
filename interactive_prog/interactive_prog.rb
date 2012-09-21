@string1
@@string2
	loop do
		puts "enter your line"
		@@string2 = gets.chomp
		if @@string2 == 'q' || @@string2 == 'Q'
				break
		else
			@@string1 = gets.chomp
			if (@@string1 == "")
				puts eval @@string2
				@@string2 = ""
			end
		end
	end