# Ruby on Rails Controllers

## Responders

* Use responders [plataformatec/responders](https://github.com/plataformatec/responders) to dry up your Rails app (3.2+). Works with :html and :json

## By default, use private methods to help to mantain controllers clean

```ruby
  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :kind, :status)
  end
```
