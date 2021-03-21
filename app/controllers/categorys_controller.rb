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
      render '/ideas'
    else
      render '/ideas'
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
