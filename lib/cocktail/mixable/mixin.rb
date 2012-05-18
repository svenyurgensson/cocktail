module Cocktail
  module Mixable
    module Mixin    
    
      def mixed(base, mixin_params, &block)
        base.class_eval(&@_included_block) if instance_variable_defined?("@_included_block")
        @_included_block = block(mixin_params)
      end
       
    end
  end
end