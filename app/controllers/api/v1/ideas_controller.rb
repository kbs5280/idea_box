class Api::V1::IdeasController < ApplicationController
  def index
    ideas = Idea.all
    respond_with ideas
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      respond_with(idea, location: api_v1_ideas_path)
    else
      respond_with idea.errors
    end
  end

  def update
    idea = Idea.find(params[:id])
    if params[:idea][:vote] == "upvote"
      if idea.quality == 2
        respond_with idea
      elsif idea.quality == 1
        idea.update(quality: 2)
        respond_with idea
      elsif idea.quality == 0
        idea.update(quality: 1)
        respond_with idea
      end 
    elsif params[:idea][:vote] == "downvote"
      #downvote idea
    end
  end

  def destroy
    item = Idea.destroy(params[:id])
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body, :quantity)
    end
end
