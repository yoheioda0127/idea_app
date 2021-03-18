class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
    @category = Category.new
  end

  def create
    @idea = Idea.new(idea_params)
    @category = Category.new(category_params)
    if @idea.save && @category.save
      redirect_to action: :index
    else
      render :new
    end
  end



  
  private

  def idea_params
    params.require(:idea).permit(:category_id, :body)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
