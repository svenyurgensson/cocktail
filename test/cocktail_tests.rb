$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'test/unit'

class CocktailTest < Test::Unit::TestCase
  
  Dir.glob(File.join(File.dirname(__FILE__), "test*.rb")).map{|p|  File.basename(p, ".rb")}.each do |testname|
    define_method testname do
      require testname
    end
  end
    
end

