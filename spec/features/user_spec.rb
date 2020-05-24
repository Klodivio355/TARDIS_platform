require 'rails_helper'

describe 'Log in' do
  it 'should redirect to sign up' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_content 'Sign up'
  end

  it 'should log in with email' do
    FactoryBot.create :user
    visit '/'
	  email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_content 'Study List'
    expect(page).to have_content email
  end

  it 'should log in with username' do
    FactoryBot.create :user
    visit '/'
	  email = 'dm@example.com'
	  fill_in 'user_login', :with => 'test1'
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_content 'Study List'
    expect(page).to have_content email
  end

  it 'should not log in - incorrect password' do
    FactoryBot.create :user
    visit '/'
	  email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    expect(page).to have_content 'Invalid Login or password'
  end

  it 'should not log in - incorrect email' do
    FactoryBot.create :user
    visit '/'
	  email = 'test2@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_content 'Invalid Login or password'
  end

  it 'should not log in - incorrect username' do
    FactoryBot.create :user
    visit '/'
	  fill_in 'user_login', :with => 'test2'
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_content 'Invalid Login or password'
  end
end


describe 'Sign Up' do
  it 'should create new user account' do
  	visit new_user_registration_path
  	email = 'test2@example.com'
  	fill_in 'user_email', :with => email
    fill_in 'user_username', :with => 'test2'
  	fill_in 'user_password', :with => 'password'
  	fill_in 'user_password_confirmation', :with => 'password'
  	click_button 'Sign up'
  	expect(page).to have_content 'Study List'
    expect(page).to have_content email
  end

  it 'should not create new user account - email already exists' do
    FactoryBot.create :user
	  visit new_user_registration_path
	  email = 'dm@example.com'
	  fill_in 'user_email', :with => email
    fill_in 'user_username', :with => 'test2'
	  fill_in 'user_password', :with => 'password2'
	  fill_in 'user_password_confirmation', :with => 'password2'
	  click_button 'Sign up'
	  expect(page).to have_content 'Email has already been taken'
  end

  it 'should not create new user account - username already exists' do
    FactoryBot.create :user
	  visit new_user_registration_path
	  email = 'test2@example.com'
	  fill_in 'user_email', :with => email
    fill_in 'user_username', :with => 'test1'
	  fill_in 'user_password', :with => 'password2'
	  fill_in 'user_password_confirmation', :with => 'password2'
	  click_button 'Sign up'
	  expect(page).to have_content 'Username has already been taken'
  end

  it 'should not create new user account - password not same as password confirmation' do
    FactoryBot.create :user
	  visit new_user_registration_path
	  email = 'test2@example.com'
	  fill_in 'user_email', :with => email
    fill_in 'user_username', :with => 'test2'
	  fill_in 'user_password', :with => 'password2'
	  fill_in 'user_password_confirmation', :with => 'password3'
	  click_button 'Sign up'
	  expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end

  it 'back button redirects to log in' do
	  visit new_user_registration_path
	  click_link 'Back'
	  expect(page).to have_content 'Log in'
  end
end

describe 'Change your password' do
  it 'should change my password' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link email
    click_link 'Change password'
    fill_in 'user_current_password', :with => 'password1'
    fill_in 'user_password', :with => 'password2'
    fill_in 'user_password_confirmation', :with => 'password2'
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully.'
  end

  it 'should not change my password - current password incorrect' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link email
    click_link 'Change password'
    fill_in 'user_current_password', :with => 'password2'
    fill_in 'user_password', :with => 'password3'
    fill_in 'user_password_confirmation', :with => 'password3'
    click_button 'Update'
    expect(page).to have_content 'Current password is invalid'
  end

  it 'should not change my password - password and confirm password do not match' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link email
    click_link 'Change password'
    fill_in 'user_current_password', :with => 'password1'
    fill_in 'user_password', :with => 'password2'
    fill_in 'user_password_confirmation', :with => 'password3'
    click_button 'Update'
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end

  it 'should redirect to Study List' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link email
    click_link 'Change password'
    click_link 'Back'
    expect(page).to have_content 'Study List'
  end
end

describe 'User access level' do
  it 'should show pages only accessed by data manager' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_content 'Studies'
    expect(page).to have_content 'Current Studies'
    expect(page).to have_content 'Manage Hours'
    expect(page).not_to have_content 'Study Hours'
    expect(page).not_to have_content 'Tasks'
    expect(page).not_to have_content 'Month Timeline'
    expect(page).not_to have_content 'Data Managers'
    expect(page).not_to have_content 'Manager Hours'
  end

  it 'should show pages only accessed by admin' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_content 'Studies'
    expect(page).to have_content 'Study Hours'
    expect(page).to have_content 'Tasks'
    expect(page).to have_content 'Month Timeline'
    expect(page).to have_content 'Data Managers'
    expect(page).to have_content 'Manager Hours'
    expect(page).not_to have_content 'Current Studies'
    expect(page).not_to have_content 'Manage Hours'
  end
end

describe 'Log out' do
  it 'should redirect to log in' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link email
    click_link 'Log out'
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end

describe 'Listing users for admin' do
  it 'should show all users of the system' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Data Managers'
    within(:css, 'table') { expect(page).to have_content 'dm@example.com' }
    within(:css, 'table') { expect(page).to have_content 'admin@example.com' }
  end
end
