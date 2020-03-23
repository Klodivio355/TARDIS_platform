Rails.application.routes.draw do

  resources :study_tasks
  resources :task_lists
  resources :studies do
    post :search, on: :collection
  end

  get :study_hours_timeline, to: 'studies#study_hours_timeline'


  devise_for :users
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  root to: "pages#home"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
