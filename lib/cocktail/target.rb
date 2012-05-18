module Cocktail
  module Target
    
    def mixin(mod, params = {})
      mod.send :mixto, self, params
    end
    
  end
end