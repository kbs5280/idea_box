require 'rails_helper'

include RequestHelper
describe 'Ideas API controller' do
  scenario 'it creates and idea' do

    post '/api/v1/ideas', params: { title: 'Test Title One',
                                    body: 'Test idea one',
                                    quality: 0 }

    expect(response).to be_success
    expect(json[:title]).to eq 'Test Title One'
    expect(json[:body]).to eq 'Test idea one'
  end
end
