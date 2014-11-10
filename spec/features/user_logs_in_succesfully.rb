require 'rails_helper'

feature 'Home page after login' do

  scenario 'with valid email' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit new_todo_path
  end
end