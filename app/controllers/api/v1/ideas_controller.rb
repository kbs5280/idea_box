class Api::V1::IdeasController < ApplicationController
  def index
    ideas = Idea.all
    respond_with ideas 
  end
end
