require 'helper'

banner "Mixed called on mixin"

assert_raise(Breakpoint, fail("Breakpoint not reached")) do    
  module M
    extend Mixin
    mixed do |mix_params|
      raise Breakpoint
    end
  end
  
  class A
    mixin(M)
  end
end 

