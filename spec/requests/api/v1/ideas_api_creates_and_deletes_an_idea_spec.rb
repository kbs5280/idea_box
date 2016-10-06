require 'rails_helper'

include RequestHelper
describe 'Ideas API controller creates idea' do
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
  end
end
