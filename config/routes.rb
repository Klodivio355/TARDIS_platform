Rails.application.routes.draw do

  resources :manager_hours
  resources :studies
  resources :study_tasks do
    resources :studies
  end
  resources :task_lists
  resources :studies do
    post :search, on: :collection
    #resources :study_tasks
  end

  get :study_hours_timeline, to: 'studies#study_hours_timeline'
  get :month_timeline, to: 'studies#month_timeline'
  get :data_managers, to: 'users#data_managers'
  get :new_user, to: 'users#new'
  get :dm_studies, to: 'studies#dm_studies'

  get :dm_hours, to: 'manager_hours#dm_hours'
  get :dm_hours_2021, to: 'manager_hours#dm_hours_2021'
  get :dm_hours_2022, to: 'manager_hours#dm_hours_2022'
  get :dm_hours_2023, to: 'manager_hours#dm_hours_2023'
  get :dm_hours_2024, to: 'manager_hours#dm_hours_2024'
  get :dm_hours_2025, to: 'manager_hours#dm_hours_2025'
  get :dm_hours_2026, to: 'manager_hours#dm_hours_2026'
  get :dm_hours_2027, to: 'manager_hours#dm_hours_2027'
  get :dm_hours_2028, to: 'manager_hours#dm_hours_2028'
  get :dm_hours_2029, to: 'manager_hours#dm_hours_2029'
  get :dm_hours_2030, to: 'manager_hours#dm_hours_2030'

  get :manager_hours_2021, to: 'manager_hours#index_2021'
  get :manager_hours_2022, to: 'manager_hours#index_2022'
  get :manager_hours_2023, to: 'manager_hours#index_2023'
  get :manager_hours_2024, to: 'manager_hours#index_2024'
  get :manager_hours_2025, to: 'manager_hours#index_2025'
  get :manager_hours_2026, to: 'manager_hours#index_2026'
  get :manager_hours_2027, to: 'manager_hours#index_2027'
  get :manager_hours_2028, to: 'manager_hours#index_2028'
  get :manager_hours_2029, to: 'manager_hours#index_2029'
  get :manager_hours_2030, to: 'manager_hours#index_2030'

  get :month_timeline_2019, to: 'studies#month_timeline_2019'
  get :month_timeline_2021, to: 'studies#month_timeline_2021'
  get :month_timeline_2022, to: 'studies#month_timeline_2022'
  get :month_timeline_2023, to: 'studies#month_timeline_2023'
  get :month_timeline_2024, to: 'studies#month_timeline_2024'
  get :month_timeline_2025, to: 'studies#month_timeline_2025'
  get :month_timeline_2026, to: 'studies#month_timeline_2026'
  get :month_timeline_2027, to: 'studies#month_timeline_2027'
  get :month_timeline_2028, to: 'studies#month_timeline_2028'
  get :month_timeline_2029, to: 'studies#month_timeline_2029'
  get :month_timeline_2030, to: 'studies#month_timeline_2030'

  get :study_hours_timeline_2019, to: 'studies#study_hours_timeline_2019'
  get :sh_timeline_2021, to: 'studies#study_hours_timeline_2021'
  get :sh_timeline_2022, to: 'studies#study_hours_timeline_2022'
  get :sh_timeline_2023, to: 'studies#study_hours_timeline_2023'
  get :sh_timeline_2024, to: 'studies#study_hours_timeline_2024'
  get :sh_timeline_2025, to: 'studies#study_hours_timeline_2025'
  get :sh_timeline_2026, to: 'studies#study_hours_timeline_2026'
  get :sh_timeline_2027, to: 'studies#study_hours_timeline_2027'
  get :sh_timeline_2028, to: 'studies#study_hours_timeline_2028'
  get :sh_timeline_2029, to: 'studies#study_hours_timeline_2029'
  get :sh_timeline_2030, to: 'studies#study_hours_timeline_2030'

  #get :hours_management, to: 'studies#hours_management'
  #get :get_tasks, to: 'studies#index_tasks'
  # get '/studies/hours_management/:study_id(.:format)/:year(.:format)/:month(.:format)/:task_name(.:format)' => 'studies#hours_management', as: :hours_management
  get '/study_tasks/edite/:study_id(.:format)/:year(.:format)/:month(.:format)/:task_name(.:format)' => 'study_tasks#edite', as: :study_tasks_edite


  get :show_dm_hours, to: 'manager_hours#new'

  get :edite_mh, to: 'manager_hours#edite'
  devise_for :users

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get '/get_tasks/:study_id' => 'studies#index_tasks', :as => :get_tasks
  get '/study_tasks/new/:study_id(.:format)' => 'study_tasks#new', :as => :add_related_task
  get '/study_tasks/guest/:study_id(.:format)' => 'study_tasks#guest', :as => :add_hours_guest
  get '/study_tasks/show/:task_name(.:format)' => 'study_tasks#show', :as => :study_task_show
  #get '/studies/generate_mt/:study_id' => 'studies#generate_mt', :as => :generate_mt

  post 'generate_mt/:study_id(.:format)/:type_of(.:format)/:start_date(.:format)/:lplv(.:format)' => 'studies#generate_mt', as: :generate_mt


  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  root to: 'studies#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
