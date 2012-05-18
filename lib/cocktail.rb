if RUBY_VERSION < "1.9"
  raise "Sorry, Cocktail requires ruby >= 1.9"
end

require "cocktail/version"
require "cocktail/mixable"
require "cocktail/target"

module Cocktail
end

Class.send :include,  Cocktail::Target
Object.send :include, Cocktail::Mixable



