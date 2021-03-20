class CategorysController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render :index 
    else
      render :index
    end
  end

  private

  def category_params
    params.permit(:name)
  end

end
