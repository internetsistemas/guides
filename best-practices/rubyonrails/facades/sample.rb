# Facade
class NewProductFacade
  def product
    Product.new
  end

  def categories
    Category.all
  end
end

# Controller
class ProductsController < ApplicationController
  def new
    @new_product_facade = NewProductFacade.new
    respond_with @new_product_facade.product
  end
end

# Test
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
