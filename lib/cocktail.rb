require "cocktail/version"
require "cocktail/mixable"
require "cocktail/target"

# eg.
# 
# class PostsController < Controller
#   mixin(MyScaffold, :resource => Post, :only => :show)
#   
# end

module Cocktail



end

Class.send :include,  Cocktail::Target
Object.send :include, Cocktail::Mixable