require "cocktail/version"


# es.
# 
# class PostsController < Controller
#   mixin(MyScaffold, :resource => Post, :only => :show)
#   
#   
# end

module Cocktail
  def mixin(module, options = {})
    self.send(:include, module.mixin(options))
  end
end

