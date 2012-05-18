require "cocktail/version"
require "cocktail/mixin"

# eg.
# 
# class PostsController < Controller
#   mixin(MyScaffold, :resource => Post, :only => :show)
#   
# end

module Cocktail



end

Class.send :include,  Cocktail::Target
Module.send :include, Cocktail::Mixable