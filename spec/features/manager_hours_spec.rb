require 'rails_helper'

describe 'Manager Hours navigation' do
  it 'should redirect to Manager Hours 2020' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    expect(page).to have_content 'Data Manager Working Hours 2020'
  end

  it 'should redirect to Manager Hours 2019' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2019'
    expect(page).to have_content 'Data Manager Working Hours 2019'
  end

  it 'should redirect to Manager Hours 2021' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2021'
    expect(page).to have_content 'Data Manager Working Hours 2021'
  end

  it 'should redirect to Manager Hours 2022' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2022'
    expect(page).to have_content 'Data Manager Working Hours 2022'
  end

  it 'should redirect to Manager Hours 2023' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2023'
    expect(page).to have_content 'Data Manager Working Hours 2023'
  end

  it 'should redirect to Manager Hours 2024' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2024'
    expect(page).to have_content 'Data Manager Working Hours 2024'
  end

  it 'should redirect to Manager Hours 2025' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2025'
    expect(page).to have_content 'Data Manager Working Hours 2025'
  end

  it 'should redirect to Manager Hours 2026' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2026'
    expect(page).to have_content 'Data Manager Working Hours 2026'
  end

  it 'should redirect to Manager Hours 2027' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2027'
    expect(page).to have_content 'Data Manager Working Hours 2027'
  end

  it 'should redirect to Manager Hours 2028' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2028'
    expect(page).to have_content 'Data Manager Working Hours 2028'
  end

  it 'should redirect to Manager Hours 2029' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2029'
    expect(page).to have_content 'Data Manager Working Hours 2029'
  end

  it 'should redirect to Manager Hours 2030' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link '2030'
    expect(page).to have_content 'Data Manager Working Hours 2030'
  end
end

describe 'Managing manager hours' do
  it 'admin should be able to add a new manager hour for themselves' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link 'New Manager hour'
    fill_in 'manager_hour_email', :with => email
    fill_in 'manager_hour_available_hours', :with => 20
    fill_in 'manager_hour_allocated_hours', :with => 10
    fill_in 'manager_hour_holiday_hours', :with => 6
    fill_in 'manager_hour_spare_hours', :with => 4
    fill_in 'manager_hour_year', :with => 2020
    fill_in 'manager_hour_month', :with => 01
    click_button 'Create Manager hour'
    expect(page).to have_content 'Manager hour was successfully created'
    expect(page).to have_content 'Assign Manager Hours'
  end

  it 'admin should be able to add a new manager hour for another manager' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link 'New Manager hour'
    fill_in 'manager_hour_email', :with => 'dm@example.com'
    fill_in 'manager_hour_available_hours', :with => 20
    fill_in 'manager_hour_allocated_hours', :with => 10
    fill_in 'manager_hour_holiday_hours', :with => 6
    fill_in 'manager_hour_spare_hours', :with => 4
    fill_in 'manager_hour_year', :with => 2020
    fill_in 'manager_hour_month', :with => 01
    click_button 'Create Manager hour'
    expect(page).to have_content 'Manager hour was successfully created'
    expect(page).to have_content 'Assign Manager Hours'
  end

  it 'back button should redirect to Data Manager Working Hours' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    click_link 'New Manager hour'
    click_link 'Back'
    expect(page).to have_content 'Data Manager Working Hours 2020'
  end

  it 'should display admin manager hours' do
    FactoryBot.create :user, email: 'admin@example.com', admin: true
    FactoryBot.create :manager_hour
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password1'
	  click_button 'Log in'
    click_link 'Manager Hours'
    within(:css, 'table') { expect(page).to have_content 'admin@example.com' }
    expect(page).to have_content '20'
    expect(page).to have_content '10'
    expect(page).to have_content '6'
    expect(page).to have_content '4'
  end

  it 'should display another manager\'s hours' do
    user1 = FactoryBot.create :user
    user2 = FactoryBot.create :user, email: 'admin@example.com', username: 'test2', password: 'password2', admin: true
    FactoryBot.create :manager_hour, email: 'dm@example.com'
    visit '/'
    email = 'admin@example.com'
	  fill_in 'user_login', :with => email
	  fill_in 'user_password', :with => 'password2'
	  click_button 'Log in'
    click_link 'Manager Hours'
    within(:css, 'table') { expect(page).to have_content 'dm@example.com' }
    expect(page).to have_content '20'
    expect(page).to have_content '10'
    expect(page).to have_content '6'
    expect(page).to have_content '4'
  end
end
