require 'rails_helper'

feature 'Logged in user views Todo list' do

  before do
    @user = create(:user)  
    4.times { create(:todo, user: @user)}
  end

  scenario 'with Todos' do
    sign_in
    visit todos_path
    expect( page ).to have_selector('div.line-items')
  end

  scenario "without Todos" do
    sign_in
    @user.todos.destroy!
    expect( page ).to have_no_selector('div.line-items')
  end


  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

end
