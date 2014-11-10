require 'rails_helper'

feature 'Visitor signs in' do


  scenario 'with valid email and password' do
    user_login
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect( page ).to have_content('Signed in successfully')
  end

  scenario 'with invalid email' do
    user_login
    fill_in 'Email', with: 'papa@invalid.com'
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    find_link('Sign In').visible?
  end

  scenario 'with blank password' do
    user_login
    fill_in 'Email', with: @user.email
    click_button 'Log in'
    find_link('Sign In').visible?
  end

  def user_login
    @user = create(:user)
    visit new_user_session_path
  end
  
end
