require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Jin',
      last_name: 'Ha',
      email: 'test@test.com',
      password: '0000000',
      password_confirmation: '0000000'
    )
  end
  scenario "Registerd users can login" do
    # ACT
    visit login_path
  
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '0000000'
    find('input[type="submit"]').click

    save_screenshot

    expect(page).to have_css('#navbar', text: "Signed in as Jin")
    
  end

end
