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

``` rb
class PostsController < Controller
  mixin(MyScaffold, :resource => Post, :only => :show)
end
```



