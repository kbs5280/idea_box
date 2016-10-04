require 'rails_helper'

describe 'User sees the ideas form', type: :feature do
  scenario 'and content on the index page' do

    visit root_path

    expect(page).to have_content 'Title'
    expect(page).to have_content 'Body'
    expect(page).to have_selector(:link_or_button, "Save")
  end
end
