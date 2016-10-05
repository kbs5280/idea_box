require 'rails_helper'

include RequestHelper
describe 'Ideas API controller' do
  it 'sends a list of ideas' do
    ideas = create_list(:idea, 10)

    get '/api/v1/ideas'

    expect(response).to be_success

    expect(json.first[:title]).to eq ideas.first.title
  end
end
