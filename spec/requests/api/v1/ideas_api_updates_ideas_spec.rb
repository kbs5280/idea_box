require 'rails_helper'

include RequestHelper
describe 'Ideas API controller updates idea' do
  it 'returns the idea' do

    post '/api/v1/ideas', params: {idea:
                                  { title: 'Test Title One',
                                    body: 'Test idea one',
                                    quality: 0 }
                                  }

    expect(response).to be_success

    expect(json[:title]).to eq 'Test Title One'
    expect(json[:body]).to eq 'Test idea one'
    expect(json.count).to eq 6

    post '/api/v1/ideas', params: {idea:
                                  { title: 'Updated Title One',
                          }
                          }

    expect(response).to be_success

    expect(json[:title]).to eq 'Updated Title One'
    expect(json.count).to eq 6
  end
end
