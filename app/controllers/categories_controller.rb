class CategoriesController < ApplicationController

  def show
    authorize
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
