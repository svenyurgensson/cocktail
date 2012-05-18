module Cocktail
  module Mixable
    module Mixin    
    
     def mixto(base, params, *args)
       
       if instance_variable_defined?("@_mixed_block")
         mixed_block = @_mixed_block
         if mixed_block.arity == -1 
           base.class_exec base, params, *args, &mixed_block
         elsif mixed_block.arity == 2
           base.class_exec base, params, &mixed_block
         else
           base.class_exec params, &mixed_block
         end         
       end
       
     end
    
     def mixed(&block)
       @_mixed_block = block
     end
       
    end
  end
end