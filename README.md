# Cocktail
Ruby parametric mixins

## Installation

```
gem install 'cocktail'
```

## Usage


``` rb
class PostsController < Controller
  mixin(MyScaffold, :resource => Post, :only => :show)
end
```



