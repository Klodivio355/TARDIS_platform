require 'rails_helper'

describe 'Study List navigation to and from Add new Study' do
  it 'should redirect to Add New Study' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'New Study'
    expect(page).to have_content 'Add New Study'
  end

  it 'should go back to Study List from Add New Study' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'New Study'
    click_link 'Back'
    expect(page).to have_content 'Study List'
  end
end

describe 'Study List - adding new studies' do
  it 'admin should be able to add a new study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'New Study'
    fill_in 'study_study_name', :with => 'test study 1'
	  fill_in 'study_stage', :with => 'test stage 1'
    fill_in 'study_type_of', :with => 'test type of 1'
    fill_in 'study_notes', :with => 'test notes'
    fill_in 'study_lead_manager', :with => email
    fill_in 'study_backup_manager', :with => 'dm@example.com'
    click_button 'Create Study'
    expect(page).to have_content 'Study was successfully created'
  end

  it 'dm should be able to add a new study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'New Study'
    fill_in 'study_study_name', :with => 'test study 1'
	  fill_in 'study_stage', :with => 'test stage 1'
    fill_in 'study_type_of', :with => 'test type of 1'
    fill_in 'study_notes', :with => 'test notes'
    fill_in 'study_lead_manager', :with => email
    fill_in 'study_backup_manager', :with => 'dm@example.com'
    click_button 'Create Study'
    expect(page).to have_content 'Study was successfully created'
  end
end
