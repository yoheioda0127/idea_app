class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    # @category = Category.find(params[:category_id])
    @category = Category.includes(:category_id)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @idea =Idea.find(params[:id])
  end

  def search
    if params[:category_id].present?
      @idea = Idea.where('category_id LIKE ?', "%#{params[:id]}%")
    else
      @idea = Idea.none
    end
  end


  
  private

  def idea_params
    params.require(:idea).permit(:category_id, :body)
  end

end
