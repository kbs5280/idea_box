class Idea < ApplicationRecord

   def self.check_params(params, idea)
    if params[:title] && params[:body]
      idea.update(title: params[:title], body: params[:body])
    elsif params[:title]
      idea.update(title: params[:title])
    elsif params[:body]
      idea.update(body: params[:body])
    elsif params[:vote] == "upvote"
      check_upvote(idea)
    elsif params[:vote] == "downvote"
      check_downvote(idea)
    end
  end

  def self.check_upvote(idea)
    if idea.quality == 'genius'
    elsif idea.quality == 'plausible'
      idea.update(quality: 'genius')
    elsif idea.quality == 'swill'
      idea.update(quality: 'plausible')
    end
  end

  def self.check_downvote(idea)
    if idea.quality == 'swill'
    elsif idea.quality == 'plausible'
      idea.update(quality: 'swill')
    elsif idea.quality == 'genius'
      idea.update(quality: 'plausible')
    end
  end
end
