class IdeasController < ApplicationController
  
  def index
    @ideas = Idea.all.order("created_at DESC")
    @category = Category.all
  end

  def new
    @idea = Idea.new
    @category = Category.new
  end

  def create
    @idea = Idea.new(idea_params)
    @category = Category.new(category_params)
    if @idea.save
      render :index
    else
      render :index
    end
    if @category.save
      render :new
    else
      render :new
    end
  end

  def search
    if params[:category_id].present?
      @idea = Idea.where('category_id LIKE ?', "%#{params[:id]}%")
    else
      @idea = Idea.none
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    redirect_to root_path
  end

  
  private

  def idea_params
    params.require(:idea).permit(:category_id, :body)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
