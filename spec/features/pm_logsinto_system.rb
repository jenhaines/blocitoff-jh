require 'rails_helper'

feature 'Project manager signs up for new account' do
  scenario 'Successfully' do
    visit root_path
    click_link('Sign Up')
    expect( page ).to have_content('Email')
  end

end