module Cocktail
  module Target
    
    # +mixin(m : Module, params : Hash)+ takes each method of +m+ 
    # and redefines them for +self+, +params+ are evaluated
    # in the context of +m+
    def mixin(mod, params = {})
      mod.mixed(self, params)
    end
    
  end
end