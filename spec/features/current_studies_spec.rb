require 'rails_helper'

describe 'Current Studies navigation' do
  it 'should redirect to All Study Timelines' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Current Studies'
    expect(page).to have_content 'All Study Timelines'
  end

  it 'should redirect to Edit Existing Study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Current Studies'
    click_link 'Edit'
    expect(page).to have_content 'Edit Existing Study'
  end

  it 'should redirect to All Study Timelines from Edit Existing Study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Current Studies'
    click_link 'Edit'
    click_link 'Back'
    expect(page).to have_content 'Study List'
  end

  it 'should redirect to Listing Specific Tasks Assigned to Studies' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    study = FactoryBot.create :study
    FactoryBot.create :study_task, study_id: study.study_id
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Current Studies'
    click_link 'Tasks'
    expect(page).to have_content 'Listing Specific Tasks Assigned to Studies'
  end
end

describe 'All Study Timelines display' do
  it 'Should only display studies that the user is working on' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'dm2@example.com', username: 'test2'
    user3 = FactoryBot.create :user, email: 'admin@example.com', username: 'test3', admin: true
    FactoryBot.create :task_list
    study1 = FactoryBot.create :study
    study2 = FactoryBot.create :study, study_name: 'Study 2', backup_manager: 'dm2@example.com'
    visit '/'
    email = 'dm@example.com'
    fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Current Studies'
    within(:css, 'table') { expect(page).to have_content 'Study 1' }
    within(:css, 'table') {expect(page).not_to have_content 'Study 2'}
  end
end
