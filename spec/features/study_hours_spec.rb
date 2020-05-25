require 'rails_helper'

describe 'Study Hours navigation' do
  it 'should redirect to Study Hours 2020' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    expect(page).to have_content 'Study Hours Timeline 2020'
  end

  it 'should redirect to Study Hours 2019' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2019'
    expect(page).to have_content 'Study Hours Timeline 2019'
  end

  it 'should redirect to Study Hours 2021' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2021'
    expect(page).to have_content 'Study Hours Timeline 2021'
  end

  it 'should redirect to Study Hours 2022' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2022'
    expect(page).to have_content 'Study Hours Timeline 2022'
  end

  it 'should redirect to Study Hours 2023' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2023'
    expect(page).to have_content 'Study Hours Timeline 2023'
  end

  it 'should redirect to Study Hours 2024' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2024'
    expect(page).to have_content 'Study Hours Timeline 2024'
  end

  it 'should redirect to Study Hours 2025' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2025'
    expect(page).to have_content 'Study Hours Timeline 2025'
  end

  it 'should redirect to Study Hours 2026' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2026'
    expect(page).to have_content 'Study Hours Timeline 2026'
  end

  it 'should redirect to Study Hours 2027' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2027'
    expect(page).to have_content 'Study Hours Timeline 2027'
  end

  it 'should redirect to Study Hours 2028' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2028'
    expect(page).to have_content 'Study Hours Timeline 2028'
  end

  it 'should redirect to Study Hours 2029' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2029'
    expect(page).to have_content 'Study Hours Timeline 2029'
  end

  it 'should redirect to Study Hours 2030' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    click_link '2030'
    expect(page).to have_content 'Study Hours Timeline 2030'
  end
end

describe 'Study Hours displays hours worked on a study' do
  it 'lead hours worked' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    study = FactoryBot.create :study
    FactoryBot.create :study_task, study_id: study.study_id
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Study Hours'
    within(:css, 'table') { expect(page).to have_content '10' }
  end

  it 'backup hours worked' do
    user1 = FactoryBot.create :user, admin: true
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :task_list
    study = FactoryBot.create :study
    FactoryBot.create :study_task, study_id: study.study_id
    visit '/'
    email = 'dm@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Study Hours'
    within(:css, 'table') { expect(page).to have_content '20' }
  end

  it 'backup hours worked' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    user3 = FactoryBot.create :user, email: 'guest@example.com', username: 'test3', password: 'password3', admin: true
    FactoryBot.create :task_list
    study = FactoryBot.create :study
    FactoryBot.create :study_task, study_id: study.study_id
    visit '/'
    email = 'guest@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password3'
	  click_button 'Log in'
    click_link 'Study Hours'
    within(:css, 'table') { expect(page).to have_content '30' }
  end
end
