require 'helper'

banner "Module/Target context clashes"

module M2
  extend Mixin
      
  mixed do |params|
    define_method :"#{params[:name]}" do
      "#{params[:name]}"
    end
  end
end
    
class A
  mixin M2, :name => "john"
  
  def params
    {:name => "mary"}
  end
end


assert A.new.respond_to?(:john), fail("Unexpected: target context shadows the module context")

