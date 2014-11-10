require 'rails_helper'

feature 'Project manager creates TODO' do
  scenario 'Successfully' do
    sign_in
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Meet up with the team')
    expect( page ).to have_content('Your new TODO was saved')
  end

  # scenario "Without a description" do
  #   visit new_todo_path
  #   click_button 'Save'
  #   expect( page ).to have_content('Please fill in the todo description')
  # end

  def sign_in
    @user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

end
