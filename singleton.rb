lion = "lion"
sheep = "sheep"
class << lion
  def speak 
    puts "#{self} roars"
  end
end
def lion.feet 
  puts "#{self} = 4 feet"
end
lion.speak
lion.feet
sheep.speak
sheep.feet
