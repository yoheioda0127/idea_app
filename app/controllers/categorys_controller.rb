class CategorysController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_idea_path
    else
      redirect_to new_idea_path
    end
  end

  private

  def category_params
    binding.pry
    params.require(:category).permit(:name)
    binding.pry
  end

end
