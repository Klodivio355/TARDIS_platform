require 'rails_helper'

describe 'Study List navigation' do
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

  it 'should redirect to Edit Existing Study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Edit'
    expect(page).to have_content 'Edit Existing Study'
  end

  it 'should redirect to Assign Task to Study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Add Task'
    expect(page).to have_content 'Assign Task to Study'
  end
end

describe 'Study List - managing studies' do
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
    fill_in 'study_backup_manager', :with => 'admin@example.com'
    click_button 'Create Study'
    expect(page).to have_content 'Study was successfully created'
  end

  it 'admin should be able to edit a study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Edit'
    fill_in 'study_study_name', :with => 'test study 1'
	  fill_in 'study_stage', :with => 'test stage 1'
    fill_in 'study_type_of', :with => 'test type of 1'
    fill_in 'study_notes', :with => 'test notes'
    fill_in 'study_lead_manager', :with => 'dm@example.com'
    fill_in 'study_backup_manager', :with => email
    click_button 'Update Study'
    expect(page).to have_content 'Study was successfully updated'
  end

  it 'should be able to assign task to study - lead' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list, task_name: 'CRFs'
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Add Task'
    fill_in 'study_task_task_name', :with => 'CRFs'
    fill_in 'study_task_year', :with => '2021'
    fill_in 'study_task_month', :with => '08'
    fill_in 'study_task_lead_hours_worked', :with => '4'
    click_button 'Create Study task'
    expect(page).to have_content 'Study task was successfully created'
  end

  it 'should be able to assign task to study - backup' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list, task_name: 'CRFs'
    FactoryBot.create :study
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Add Task'
    fill_in 'study_task_task_name', :with => 'CRFs'
    fill_in 'study_task_year', :with => '2021'
    fill_in 'study_task_month', :with => '08'
    fill_in 'study_task_backup_hours_worked', :with => '4'
    click_button 'Create Study task'
    expect(page).to have_content 'Study task was successfully created'
  end

  it 'should be able to assign task to study - guest' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    user3 = FactoryBot.create :user, email: 'guest@example.com', username: 'test3', password: 'password3'
    FactoryBot.create :task_list, task_name: 'CRFs'
    FactoryBot.create :study
    visit '/'
    email = 'guest@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password3'
	  click_button 'Log in'
    click_link 'Add Task'
    fill_in 'study_task_task_name', :with => 'CRFs'
    fill_in 'study_task_year', :with => '2021'
    fill_in 'study_task_month', :with => '08'
    fill_in 'study_task_guest_hours_worked', :with => '4'
    click_button 'Create Study task'
    expect(page).to have_content 'Study task was successfully created'
  end

end
