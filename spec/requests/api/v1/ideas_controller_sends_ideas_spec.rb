require 'rails_helper'

include RequestHelper
describe 'Ideas API controller' do
  it 'sends a list of ideas' do
    first_idea = create(:idea, title: 'Test Title One', body: 'Test idea one')
    ideas = create_list(:idea, 10)

    get '/api/v1/ideas'

    expect(response).to be_success

    expect(json.first[:title]).to eq first_idea.title
    expect(json.first[:body]).to eq first_idea.body
  end
end
