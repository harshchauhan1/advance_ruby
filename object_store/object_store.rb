module MyObjectStore
  @@i = 0
  @@arr = []
  @@attributes = []
  def self.included(base)
    base.class_eval{
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
            puts "object saved"
          else
            puts "error: object not saved"
          end
          else
            @@arr << self
            puts "object saved"
          end
      else
        puts "object not saved"
      end
    end }
  base.instance_eval {
    def collect
      puts @@arr.inspect
    end
    def count
      puts @@arr.count 
    end
    def validate_presence_of (*args)
      if(args[0].class == Play)
        args[1].each do |val|
          if args[0].send(val) == nil
            return false
            break
          end
        end
        return true
      else
        args.each do |val|
          eval "def find_by_#{val} (args) 
            @@arr.each do |obj|
              if obj.send('#{val}') == args
                puts obj.inspect
              end
            end
          end"  
        end
      end
    end
}
end
end
class Play
  attr_accessor :age, :fname, :email, :lname
  include MyObjectStore 
  validate_presence_of :fname, :email, :age, :lname
  def validate
    if self.fname.length <= 2
      return false
    else
      return true
    end
  end
end
p2 = Play.new
p2.age = "22"
p2.fname = "abc"  
p2.lname = "def"
p2.email = "yahoo.com"
p2.save
p3 = Play.new
p3.age = "22"
p3.fname = "abc"  
p3.lname = "def"
p3.email = "yahoo.com"
p3.save
Play.count
Play.find_by_lname("def")
Play.collect
puts p2.validate
