require 'helper'

banner "Target scope available"

module M2
  extend Mixin
      
  mixed do |mix_params|
    define_method :"#{mix_params[:name]}" do
      "Here is a #{drink} for #{mix_params[:name]}"
    end
  end
end
    
class A
  mixin M2, :name => "john"
  
  def drink
    "Mojito"
  end
end

assert A.new.respond_to?(:john), fail("Method not mixed in")
assert A.new.john == "Here is a Mojito for john", fail("Method block not parameterized or local context not available")

