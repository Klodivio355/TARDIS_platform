require 'rails_helper'

describe 'Study view' do
  it 'should have a Search button' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'Search')
  end

  it 'should have a Reset button' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'Reset')
  end

  it 'should have a New Study button' do
    FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'New Study')
  end

  it 'should have an Edit button for a study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'Edit')
  end

  it 'should have a View Tasks button for a study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'View Tasks')
  end

  it 'should have a Add Task button for a study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'Add Task')
  end

  it 'should have a Generate Month Timeline' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
    fill_in 'user_login', :with => email
    fill_in 'user_password', :with => 'password2'
    click_button 'Log in'
    expect(page).to have_selector(:link_or_button, 'Generate Month Timeline')
  end
end

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

  it 'should redirect to Editing Assigned Task' do
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
    visit '/'
    click_link 'View Tasks'
    click_link 'Manage Hours'
    expect(page).to have_content 'Editing Assigned Task'
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

  it 'dm should be able to edit a study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
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

  it 'should display all studies in the system' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    study1 = FactoryBot.create :study
    study2 = FactoryBot.create :study, study_name: 'Study 2'
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    within(:css, 'table') { expect(page).to have_content 'Study 1' }
    within(:css, 'table') { expect(page).to have_content 'Study 2' }
  end

  it 'should display completed studies in the table' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    study1 = FactoryBot.create :study, study_finished: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    within(:css, 'table') { expect(page).to have_content 'Study 1' }
    within(:css, 'table') { expect(page).to have_content 'true' }
  end
end

describe 'Search function on Study List' do
  it 'should display searched study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    study1 = FactoryBot.create :study
    study2 = FactoryBot.create :study, study_name: 'Study 2'
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    fill_in 'search_study_name', :with => 'Study 1'
    click_button 'Search'
    within(:css, 'table') { expect(page).to have_content 'Study 1' }
    within(:css, 'table') { expect(page).not_to have_content 'Study 2' }
  end

  it 'should reset the input field' do
    user1 = FactoryBot.create :user
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    fill_in 'search_study_name', :with => 'Study 1'
    click_link 'Reset'
    expect(page).not_to have_content 'Study 1'
  end
end

describe 'Managing tasks for a specific study' do
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

  it 'should be able view a task assigned for a study' do
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
    visit '/'
    click_link 'View Tasks'
    expect(page).to have_content 'Listing Specific Tasks Assigned to Studies'
    within(:css, 'table') { expect(page).to have_content 'CRFs' }
  end

  it 'should not be able view a task assigned for a different study' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    task1 = FactoryBot.create :task_list, task_name: 'Spec'
    task2 = FactoryBot.create :task_list, task_name: 'CRFs'
    task3 = FactoryBot.create :task_list
    study = FactoryBot.create :study
    study2 = FactoryBot.create :study, study_name: 'Study 2'
    study_task1 = FactoryBot.create :study_task, task_name: 'CRFs', study_id: study.study_id
    study_task2 = FactoryBot.create :study_task, study_id: study.study_id
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'View Tasks'
    expect(page).to have_content 'Listing Specific Tasks Assigned to Studies'
    within(:css, 'table') { expect(page).to have_content 'CRFs' }
    within(:css, 'table') { expect(page).not_to have_content 'Spec' }
  end
end

describe 'Generate month timeline button' do
  it 'should generate month timeline for a study - Routine data' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_button 'Generate Month Timeline'
    expect(page).to have_content 'Month Timeline correctly generated'
  end

  it 'should generate month timeline for a study - late phase CTIMP - January' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list, task_name: 'CRFs'
    FactoryBot.create :task_list, task_name: 'Spec'
    FactoryBot.create :task_list, task_name: 'Functional QC'
    FactoryBot.create :task_list, task_name: 'Reports and DVS'
    FactoryBot.create :task_list, task_name: 'Follow up'
    study = FactoryBot.create :study, type_of: 'late phase CTIMP'
    FactoryBot.create :study_task, task_name: 'CRFs', study_id: study.study_id
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_button 'Generate Month Timeline'
    expect(page).to have_content 'Month Timeline correctly generated'
  end

  it 'should generate month timeline for a study - late phase CTIMP - August' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list, task_name: 'CRFs'
    FactoryBot.create :task_list, task_name: 'Spec'
    FactoryBot.create :task_list, task_name: 'Functional QC'
    FactoryBot.create :task_list, task_name: 'Reports and DVS'
    FactoryBot.create :task_list, task_name: 'Follow up'
    study = FactoryBot.create :study, type_of: 'late phase CTIMP', start_date: '01/08/2015'
    FactoryBot.create :study_task, task_name: 'CRFs', study_id: study.study_id
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_button 'Generate Month Timeline'
    expect(page).to have_content 'Month Timeline correctly generated'
  end

  it 'should generate month timeline for a study - late phase CTIMP - December' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list, task_name: 'CRFs'
    FactoryBot.create :task_list, task_name: 'Spec'
    FactoryBot.create :task_list, task_name: 'Functional QC'
    FactoryBot.create :task_list, task_name: 'Reports and DVS'
    FactoryBot.create :task_list, task_name: 'Follow up'
    study = FactoryBot.create :study, type_of: 'late phase CTIMP', start_date: '01/12/2019'
    FactoryBot.create :study_task, task_name: 'CRFs', study_id: study.study_id
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_button 'Generate Month Timeline'
    expect(page).to have_content 'Month Timeline correctly generated'
  end

  it 'should not display generate month timeline button again' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_button 'Generate Month Timeline'
    visit '/'
    expect(page).not_to have_content 'Generate Month Timeline'
  end
end

describe 'error pages' do
  it 'should redirect to 404' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    FactoryBot.create :study, type_of: 'test1'
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_button 'Generate Month Timeline'
    expect(page).to have_content 'Not Found 404'
  end
end
