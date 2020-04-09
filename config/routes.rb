Rails.application.routes.draw do


  resources :manager_hours
  resources :study_tasks do
    resources :studies
  end
  resources :task_lists
  resources :studies do
    post :search, on: :collection
    resources :study_tasks
  end

  get :study_hours_timeline, to: 'studies#study_hours_timeline'
  get :month_timeline, to: 'studies#month_timeline'
  get :data_managers, to: 'users#data_managers'
  get :new_user, to: 'users#new'
  #get :get_tasks, to: 'studies#index_tasks'

  devise_for :users

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get '/get_tasks/:study_id' => 'studies#index_tasks', :as => :get_tasks

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  root to: "pages#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
