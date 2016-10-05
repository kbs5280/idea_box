require 'rails_helper'

describe 'User can create an idea', type: :feature, js: true do
  let(:idea){ Fabricate(:idea) }

  context 'and views the idea on the index page'
  scenario 'and deletes the item and not longer views it on the index page ' do

    visit root_path

    fill_in 'title', with: 'Test Title One'
    fill_in 'body', with: 'Test idea one'
    
    click_button 'Save'

    expect(page).to have_content 'Test Title One'
    expect(page).to have_content 'Test idea one'

    click_on 'Delete'

    expect(page).not_to have_content 'Test Title One'
    expect(page).not_to have_content 'Test idea one'
  end
end
