require 'rubygems'
require 'test/unit'

# Bundler.setup(:default, :development)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'cocktail'

class CocktailTest < Test::Unit::TestCase
  
  class Breakpoint < Exception
  end
  
  def test_cocktail_defined
    assert_nothing_raised do
      Cocktail
    end
  end
    
  def test_mixin_defined  
    assert self.respond_to?(:mixin), "Mixin not defined"
  end
  
  def test_mixed_defined
    assert_raise(Breakpoint) do
      module M
        extend Mixin
        mixed do |mix_params|
          raise Breakpoint
        end
      end
    end 
  end
  
  def test_basic_mixin
    
    module M
      extend Mixin
      
      mixed do |mix_params|
        define_method :"#{mix_params[:name]}" do
          puts "My name is #{mix_params[:name]}"
        end
      end
    end
    
    class A
      mixin M, :name => "john"
    end
    
    assert A.instance_method_defined?(:john), "Method not mixed in"

  end
    
end

