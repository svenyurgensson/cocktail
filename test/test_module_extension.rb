require 'helper'

banner "Extending Mixins"

# A very generic scaffolding template
module Scaffold
  extend Mixin
  
  # base, params, actions
  mixed do |*_args|
    _base, _mixin_params, _actions = _args
    
    _base.send :include, _actions
        
    define_method :resource do
      _mixin_params[:resource]
    end
    
  end
  
end

# A specific scaffolding template
module MyScaffold
  extend Mixin
  
  mixed do |base, params|
    Scaffold.mixto(base, params, Actions)
  end
  
  module Actions
    def index
      @collection = resource.all
    end
    
    def show
      @object = resource.find(@id)
    end
    
  end

end

class Post
  class << self
    def all
      "returning a collection of #{self.name}s"      
    end
    
    def find(id)
      "finding a #{self.name}"
    end
  
  end
end

class Controller
  mixin MyScaffold, :resource => Post
  
end


assert Controller.new.show == "finding a Post"