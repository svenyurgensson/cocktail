# Cocktail – Ruby parametric mixins
**Cocktail** is a ruby gem that allows you to use parametric mixins in Ruby

## Installation

```
gem install cocktail
```

or in `Gemfile`

``` rb
gem "cocktail"
```

## Usage

### Mixing parametric modules

``` rb
class PostsController < Controller
  mixin(MyDynamicScaffold, :resource => Post, :only => :show)
end
```

### Defining parametric modules

``` rb

module Scaffold
  extend Mixin
  mixed do |params|
  
    class << self
      def resource(klass = nil)
        @resource = klass.nil? ? @resource : klass 
      end
    end
    
    def resource
      self.class.resource
    end
    
  end
  
  extended do
    
  end
  
  def actions(mod, params)
    only    = [params[:only]].flatten!.compact!
    exclude = [params[:exclude]].flatten!.compact!
        
    actions = [:index, :show]
    only = actions if only.empty?
    
    ((actions - exclude) & only).each do |action|
      meth = mod.method(action)
      define_method action, meth
    end
  end
  
end


module MyScaffold
  extend Scaffold

  mixed do |target, mixin_params|
    actions(Actions, mixin_params)
  end
  
  
  module Actions
    def index
      @collection = resource.all
    end
  
    def show
      @object = resource.find(params[:id])
    end
  end
  
end
```
