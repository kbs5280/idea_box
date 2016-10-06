class Idea < ApplicationRecord

   def self.check_params(params, idea)
    if params[:idea][:title]
      idea.update(title: params[:idea][:title])
    elsif params[:idea][:body]
      idea.update(body: params[:idea][:body])

    elsif params[:idea][:vote] == "upvote"

      if idea.quality == 'genius'
      elsif idea.quality == 'plausible'
        idea.update(quality: 'genius')
      elsif idea.quality == 'swill'
        idea.update(quality: 'plausible')
      end

    elsif params[:idea][:vote] == "downvote"

      if idea.quality == 'swill'
      elsif idea.quality == 'plausible'
        idea.update(quality: 'swill')
      elsif idea.quality == 'genius'
        idea.update(quality: 'plausible')
      end

    end
  end
end
