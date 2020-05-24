require 'rails_helper'

describe 'Navigation' do
  it 'should redirect to List of Available Tasks & Details' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Tasks'
    expect(page).to have_content 'List of Available Tasks & Details'
  end
end
