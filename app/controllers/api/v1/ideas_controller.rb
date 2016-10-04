class Api::V1::IdeasController < ApplicationController
  def index
    respond_with = Idea.all
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      respond_with(idea, location: api_v1_ideas_path)
    else
      respond_with idea.errors
    end
  end

  private

  def idea_params
    params.permit(:title, :body, :quanlity, :created_at, :updated_at)
  end
end
