require 'rails_helper'

describe 'User can create an idea', type: :feature do
  scenario 'and views the idea on the index page' do

    visit root_path

    fill_in 'title', with: 'Test Title One'
    fill_in 'idea', with: 'Test Idea One'
    click_button 'Save'

    expect(page).to have_content 'Test Title One'
    expect(page).to have_content 'Test Idea One'
  end
end
