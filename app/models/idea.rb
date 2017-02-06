class Idea < ApplicationRecord
  class << self

     def check_params(params, idea)
      update_title_and_body(params, idea) if params[:title] && params[:body]
      update_title(params, idea)          if params[:title]
      update_body(params, idea)           if params[:body]
      check_upvote(idea)                  if params[:vote] == "upvote"
      check_downvote(idea)                if params[:vote] == "downvote"
    end

    def update_title_and_body(params, idea)
      idea.update(title: params[:title], body: params[:body])
    end

    def update_title(params, idea)
      idea.update(title: params[:title])
    end

    def update_body(params, idea)
      idea.update(body: params[:body])
    end

    # refactor using a hash when implemented in React

    def check_upvote(idea)
      if idea.quality == 'genius'
      elsif idea.quality == 'plausible'
        idea.update(quality: 'genius')
      elsif idea.quality == 'swill'
        idea.update(quality: 'plausible')
      end
    end

    def check_downvote(idea)
      if idea.quality == 'swill'
      elsif idea.quality == 'plausible'
        idea.update(quality: 'swill')
      elsif idea.quality == 'genius'
        idea.update(quality: 'plausible')
      end
    end

  end
end
