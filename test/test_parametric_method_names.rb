require 'helper'

banner "Parametric method name"

module M2
  extend Mixin
      
  mixed do |mix_params|
    define_method :"#{mix_params[:name]}" do
      "My name is #{mix_params[:name]}"
    end
  end
end
    
class A
  mixin M2, :name => "john"
end

assert A.new.respond_to?(:john), fail("Method not mixed in")
assert A.new.john == "My name is john", fail("Method block not parameterized")

