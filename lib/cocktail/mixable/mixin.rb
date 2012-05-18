module Cocktail
  module Mixable
    module Mixin    
      
      def mixto(base, params)
        params.freeze
        
        if instance_variable_defined?("@_mixed_block")
          mixed_block = @_mixed_block
          base.class_exec params, &mixed_block
        end
      end
      module_function :mixto
    
      def mixed(&block)
        @_mixed_block = block
      end
       
    end
  end
end