module MyObjectStore
  @@arr = []
  @@attributes = []
  def self.included(base)
    base.extend(ClassMethods)
    @@attributes = Play.instance_methods - Object.methods
    @@attributes.each do |val|
      if val.to_s.include?("=")
        @@attributes.delete(val)
      end
    end
    def save
      var = self
      cond1 = self.class.instance_eval{ validate_presence_of(var, @@attributes) }
      if(cond1)
        if (self.respond_to?('validate'))
          cond2 = validate
          if(cond2)
            @@arr << self
          else
            @@arr << value
          end
        else
          @@arr << self
        end
      else
        puts "no object created"
      end
    end
  end
  module ClassMethods
    def validate_presence_of (*args)
      if(args[0].class == Play)
        puts @@attributes
      end
      # if(args[0] != nil && args[1] != nil)
      #   return true
      # else
      #   return false
      # end
    end
  end
end
class Play
  attr_accessor :age, :fname, :email, :lname
  include MyObjectStore 
  validate_presence_of :fname, :email, :age, :lname
  def validate
    if self.fname.length <= 2
      str = "error on fname"
      puts str
      return str
    else
      return true
    end
  end
end
p2 = Play.new
p2.fname = "abc"  
p2.lname = "def"
p2.email = "yahoo.com"
p2.save
p2.validate