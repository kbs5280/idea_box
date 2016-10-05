require 'rails_helper'

include RequestHelper
describe 'Ideas API controller' do
  it 'sends a list of ideas' do
    idea = create(:idea, title: 'Test Title One', body: 'Test idea one')
    ideas = create_list(:idea, 10)

    get '/api/v1/ideas'

    expect(response).to be_success

    expect(json.first[:title]).to eq 'Test Title One'
    expect(json.first[:body]).to eq 'Test idea one'
  end
end
