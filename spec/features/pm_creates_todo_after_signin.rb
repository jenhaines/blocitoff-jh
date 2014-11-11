require 'rails_helper'

feature 'Project manager creates TODO' do

  before do
    @user = create(:user)
  end

  scenario 'Successfully' do
    sign_in
    visit new_todo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new TODO was saved')
  end

  scenario "Without a description" do
    sign_in
    visit new_todo_path
    click_button 'Save'
    expect( page ).to have_content('Please fill in the todo description')
  end

  scenario "Without signing in" do
    visit new_todo_path
    expect( page ).to have_no_field('Description')
  end


  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

end
