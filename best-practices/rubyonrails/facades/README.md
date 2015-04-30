# Ruby on Rails Facades

* A best approach to solve problem when we need to use more than one instance variable in a controller action.
* Just a simple PORO.

Following the Sandi Metz [rules](https://robots.thoughtbot.com/sandi-metz-rules-for-developers), it's not a good pratice
use more than one instance variable in a controller action, like this:

```ruby
class ProductsController < ApplicationController

  def new
    @product = Product.new
    @categories = Category.all
  end

  # other methods..
end
```

One option to remove this problem, is using other bad pratice, putting query for `@categories` in the view:

###### BAD

```
simple_for_for @product do |f|
  f.input :name
  f.input :category, collection: Category.all
```

###### Solution

BUT, following the Sandi Metz, to solve this problem we can use [Facade Pattern](http://pt.wikipedia.org/wiki/Fa%C3%A7ade)

To apply this pattern in your case:

```ruby
class NewProductFacade
  def product
    Product.new
  end

  def categories
    Category.all
  end
end

class ProductsController < ApplicationController
  def new
    @new_product_facade = NewProductFacade.new
    respond_with @new_product_facade.product
  end
end
```

And to use in the view:

```
simple_for_for @new_product_facade.product do |f|
  f.input :name
  f.input, collection: @new_product_facade.categories
end
```

To test we can do something like this:

```ruby

describe 'GET #new' do
  let(:new_product_facade) { NewProductFacade.new }

  it 'assing new product' do
    get :new

    expect(assings(:new_product_facade).product).to be_a_new(Product)
  end

  it 'load all categories' do
    let(:categories) { create_list(:categories, 3) }

    get :new

    expect(assings(:new_product_facade).categories).to match_array(categories)
  end
end
```

Look, Facade are mapped ONE for each ACTION, IF you need to use, so we can organize like this.

+ `app/facades/products/new_product_facade.rb`
+ `app/facades/products/show_product_facade.rb`
+ `app/facades/products/edit_product_facade.rb`
