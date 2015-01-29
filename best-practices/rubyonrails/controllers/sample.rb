class ProductsController < ApplicationController
  before_filter :admin_user!
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
    respond_with(@products)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product, location: products_path)
  end

  def update
    @product.update(product_params)
    respond_with(@product, location: products_path)
  end

  def destroy
    @product.destroy
    respond_with(@product, location: products_path)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :kind)
  end

  def admin_user!
    raise MyCustomError if !current_user.admin?
  end
end
