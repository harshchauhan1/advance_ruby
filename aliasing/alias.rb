module MyModule
  def chained_aliasing (*args) 
    self.class_eval {
      args.each do |val|
        original_method = "original#{val}"
        method_name = "#{val}".to_sym
        with_logger = "#{val}_with_logger"
        without_logger = "#{val}_without_logger" 
        alias_method original_method, method_name
        define_method("#{val}_with_logger") {
          puts "\n"
          puts '--logging start'
          send(original_method)
          puts "--logging end"
        }
        define_method("#{val}_without_logger") {
          puts "\n"
          send(original_method)
        }
        define_method("#{val}") {
          puts "\n"
          send(with_logger)
        }
      end
    }
  end
end

class Hello
  def greet
    puts 'hello'
  end
  def leave
    puts "bye"
  end
end
say = Hello.new
say.greet

class Hello
  extend MyModule
  chained_aliasing :greet,:leave
end
say = Hello.new
say.greet
say.greet_with_logger
say.greet_without_logger
say.leave
say.leave_with_logger
say.leave_without_logger