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

### Defining parametric modules

``` rb
module CocktailMaker
  extend Mixin
      
  mixed do |args|
    args[:known_recipes].each do |cocktail|
        define_method :"serve_a_#{cocktail.downcase}" do
          "Here is a #{cocktail} for you"
        end
    end
  end
end
```

### Mixing parametric modules

``` rb
class Bartender
  mixin CocktailMaker, :known_recipes => %W(Mojito Manhattan Daiquiri Negroni)
end
```

```
> puts Bartender.new.serve_a_mojito
Here is a Mojito for you
=> nil 
```

###  Composing Mixins

``` rb
module Scaffold
  extend Mixin
  
  mixed do |*_args|
    base, mixin_params, actions_module = _args
    
    exclude  = mixin_params[:exclude] || []
    only     = mixin_params[:only] || []     
    resource = mixin_params[:resource]
    
    define_method :scaffolded_resource do
      resource
    end

    actions = actions_module.instance_methods
    actions = only.any? ? actions & only : actions
    actions -= exclude
    
    actions.each do |method_name|
      method_proc = actions_module.instance_method method_name
      define_method method_name, method_proc  
    end 
    
  end
  
end
```


``` rb
module MyScaffold
  extend Mixin
  
  mixed do |base, params|
    Scaffold.mixto(base, params, Actions)
  end
  
  module Actions
    def index
      @collection = scaffolded_resource.all
    end
    
    def show
      @object = scaffolded_resource.find(params[:id])
    end
  end
end
```

``` rb
class PostsController < ApplicationController
  mixin(MyScaffold, :resource => Post)
end
```

## Contributing to `cocktail`
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

---

Copyright (c) 2012 mcasimir

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.