class IdeasController < ApplicationController
  
  def index
    @ideas = Idea.all.order('created_at DESC')
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      return redirect_to root_path
    else
      return redirect_to root_path
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
end
