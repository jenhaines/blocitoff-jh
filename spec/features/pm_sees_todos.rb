require 'rails_helper'

feature 'PM creates multiple ToDos' do
  scenario 'Successfully' do
    sign_in
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    fill_in 'Description', with: 'Have lunch with the Hip Priest'
    click_button 'Save'
    expect( page ).to have_field('Description')
  end

  # scenario "Without a description" do
  #   sign_in
  #   click_button 'Save'
  #   expect( page ).to have_content('Please fill in the todo description')
  # end

  # scenario "Without signing in" do
  #   visit new_todo_path
  #   expect( page ).to have_no_field('Description')
  # end


  def sign_in
    @user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

end
