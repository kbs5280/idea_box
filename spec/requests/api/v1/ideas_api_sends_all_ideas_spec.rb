require 'rails_helper'

include RequestHelper
describe 'Ideas API controller creates ideas' do
  it 'sends a list of ideas' do
    ideas = create(:idea, title: 'Idea One', body: 'Idea one', quality: 0)
    ideas = create(:idea, title: 'Idea Two', body: 'Idea two', quality: 2)
    ideas = create(:idea, title: 'Idea Three', body: 'Idea three', quality: 3)

    get '/api/v1/ideas'

    expect(response).to be_success

    expect(json.first[:title]).to eq 'Idea One'
    expect(json.second[:body]).to eq 'Idea two'
    expect(json.count).to eq 3
  end
end
