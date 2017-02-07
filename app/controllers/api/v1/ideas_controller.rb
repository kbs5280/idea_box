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
      respond_with :json => [{ :error => "An error was encountered while
                                          processing your photos.
                                          Please try again."
                           }], :status => 304
    end
  end

  def update
    idea = Idea.find(params[:id])
    Idea.check_params(params, idea)
    respond_with idea, json: idea
  end

  def destroy
    #remove variable idea
    idea = Idea.destroy(params[:id])
  end

  private

    def idea_params
      params.permit(:title, :body, :quality)
    end
end
