module MyObjectStore
end
class Play
  include MyObjectStore

  attr_accessor :age, :fname, :email

  validate_presence_of :fname, :mail

  def validate
  end
  def save
  end
end
p2 = Play.new;
p2.fname = "abc" ; 
p2.lname = "def" ; 
p2.save ; 

# Play.find_by_fname("xyz") ; 
# Play.find_by_email("abcd") ; 
# Play.collect ; 
# Play.count