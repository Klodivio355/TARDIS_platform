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

  it 'should redirect to Editing Task Details' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    FactoryBot.create :task_list
    visit '/'
    email = 'admin@example.com'
    fill_in 'user_login', :with => email
    fill_in 'user_password', :with => 'password1'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Edit'
    expect(page).to have_content 'Editing Task Details'
  end
end

describe 'Displaying tasks on List of Available Tasks & Details' do
  it 'should display tasks in the system' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :task_list, task_name: 'CRFs', predicted_hours: 10
    visit '/'
    email = 'admin@example.com'
    fill_in 'user_login', :with => email
    fill_in 'user_password', :with => 'password1'
    click_button 'Log in'
    click_link 'Tasks'
    within(:css, 'table') { expect(page).to have_content 'Routine data' }
    within(:css, 'table') { expect(page).to have_content 'CRFs' }
  end
end

describe 'Managing tasks' do
  it 'should add a new task' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    FactoryBot.create :task_list
    visit '/'
    email = 'admin@example.com'
    fill_in 'user_login', :with => email
    fill_in 'user_password', :with => 'password1'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'New Task list'
    fill_in 'task_list_task_name', :with => 'Functional QC'
    fill_in 'task_list_predicted_hours', :with => 10
    click_button 'Create Task list'
    expect(page).to have_content 'Task list was successfully created'
    expect(page).to have_content 'Functional QC'
  end

  it 'should be able to edit a task' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    FactoryBot.create :task_list
    visit '/'
    email = 'admin@example.com'
    fill_in 'user_login', :with => email
    fill_in 'user_password', :with => 'password1'
    click_button 'Log in'
    click_link 'Tasks'
    click_link 'Edit'
    fill_in 'task_list_task_name', :with => 'Routine data test'
    fill_in 'task_list_predicted_hours', :with => '10'
    click_button 'Update Task list'
    expect(page).to have_content 'Task list was successfully updated'
  end
end