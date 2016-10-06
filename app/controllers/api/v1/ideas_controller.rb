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
    if params[:idea][:title]
      idea.update(title: params[:idea][:title])
      respond_with idea
    elsif params[:idea][:body]
      idea.update(body: params[:idea][:body])
      respond_with idea
    elsif params[:idea][:vote] == "upvote"
      if idea.quality == 'genius'
        respond_with idea
      elsif idea.quality == 'plausible'
        idea.update(quality: 'genius')
        respond_with idea
      elsif idea.quality == 'swill'
        idea.update(quality: 'plausible')
        respond_with idea
      end
    elsif params[:idea][:vote] == "downvote"
      if idea.quality == 'swill'
        respond_with idea
      elsif idea.quality == 'plausible'
        idea.update(quality: 'swill')
        respond_with idea
      elsif idea.quality == 'genius'
        idea.update(quality: 'plausible')
        respond_with idea
      end
    end
  end

  def destroy
    item = Idea.destroy(params[:id])
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body, :quality)
    end
end
