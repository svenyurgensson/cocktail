# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cocktail/version"

Gem::Specification.new do |s|
  s.name        = "cocktail"
  s.version     = Cocktail::VERSION
  s.authors     = ["Maurizio Casimirri"]
  s.email       = ["maurizio.cas@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby parametric mixins}
  s.description = %q{Cocktail is a ruby gem that allows you to use parametric mixins in Ruby}

  s.rubyforge_project = "cocktail"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
end
