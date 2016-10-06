class Api::V1::IdeasController < ApplicationController
  def index
    ideas = Idea.all.order(created_at: :desc)
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
    Idea.check_params(params, idea)
  end

  def destroy
    item = Idea.destroy(params[:id])
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body, :quality)
    end
end
