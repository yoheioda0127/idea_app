class CategorysController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      return redirect_to root_path
    else
      return redirect_to root_path
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
