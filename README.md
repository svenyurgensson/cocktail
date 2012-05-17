# Cocktail
Ruby parametric mixins

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
module MyDynamicScaffold
  mixed do |target, params|
  
    only    = [params[:only]].flatten!.compact!
    exclude = [params[:exclude]].flatten!.compact!
        
    actions = [:index, :show]
    only = actions if only.empty?
    
    target.class_eval do
      ((actions - exclude) & only).each do |action|
        meth = MyScaffold.method(action)
        define_method action, meth
      end
    end
 
  end
  
  def index
    # ...
  end
  
  def show
    # ...
  end
  
end
```
