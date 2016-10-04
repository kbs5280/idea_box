require 'rails_helper'

describe 'Ideas API controller' do
  it 'sends a list of ideas' do
    ideas = create_list(:idea, 10)

    get '/api/v1/ideas'
require "pry"; binding.pry
    expect(response).to be_success
  end
end
