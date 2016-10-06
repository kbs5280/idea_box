require 'rails_helper'

describe 'Vote Idea', type: :model do
  it 'updates idea quality based on upvote' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one', quality: 'swill')
    params = { idea:{ vote: "upvote" }}

    Idea.check_params(params, idea)

    expect(idea.quality).to eq 'plausible'
  end

  it 'updates idea quality based on upvote' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one', quality: 'plausible')
    params = { idea:{ vote: "upvote" }}

    Idea.check_params(params, idea)

    expect(idea.quality).to eq 'genius'
  end

  it 'updates idea quality based on downvote' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one', quality: 'plausible')
    params = { idea:{ vote: "downvote" }}

    Idea.check_params(params, idea)

    expect(idea.quality).to eq 'swill'
  end

  it 'updates idea quality based on downvote' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one', quality: 'genius')
    params = { idea:{ vote: "downvote" }}

    Idea.check_params(params, idea)

    expect(idea.quality).to eq 'plausible'
  end

  it 'does not change idea quality based on downvote if already swill' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one', quality: 'swill')
    params = { idea:{ vote: "downvote" }}

    Idea.check_params(params, idea)

    expect(idea.quality).to eq 'swill'
  end

  it 'does not update idea quality based on upvote if already genius' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one', quality: 'genius')
    params = { idea:{ vote: "upvote" }}

    Idea.check_params(params, idea)

    expect(idea.quality).to eq 'genius'
  end
end
