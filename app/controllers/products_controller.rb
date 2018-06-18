class ProductsController < ApplicationController

  def index
    authorize
    @products = Product.all.order(created_at: :desc)
  end

  def show
    authorize
    @product = Product.find params[:id]
  end

end
