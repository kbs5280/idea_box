require 'rails_helper'

describe 'Edit Idea', type: :model do
  it 'updates idea title based on conditions' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one')
    params = { idea:{ title: "Updated Title One" }}

    Idea.check_params(params, idea)

    expect(idea.title).to eq 'Updated Title One'
  end

  it 'updates idea body based on conditions' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one')
    params = { idea:{ body: "Updated body one" }}

    Idea.check_params(params, idea)

    expect(idea.body).to eq 'Updated body one'
  end
end
