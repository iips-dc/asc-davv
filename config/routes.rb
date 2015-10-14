AscDavv::Application.routes.draw do

  resources :schedules, only: [:new, :create, :destroy]

  match '/upload_success' => 'schedules#success'

  resources :feedbacks

  match '/recorded' => 'feedbacks#success'

  match '/report' => 'feedbacks#report'

  match '/graphs' => 'feedbacks#report_iframe'

  resources :resource_people

  resources :notices, except: [:index]
  
  devise_for :admins, :controllers => { :registrations => 'registration' }, :skip => [:sessions]
  as :admin do
    get 'signin' => 'devise/sessions#new', :as => :new_admin_session
    post 'signin' => 'devise/sessions#create', :as => :admin_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_admin_session
    get 'accessdenied123' => 'registration#new', :as => :new_admin_registration
    get 'edit' => 'registration#edit', :as => :edit_admin_registration
  end

  resources :courses

  match '/courses_success' => 'courses#success'

  resources :shortterm_courses

  match '/shortterm_instructions' => 'shortterm_courses#instructions'

  match '/shortterm_registered/:id' => 'shortterm_courses#registered'

  match '/shortterm_record' => 'shortterm_courses#record'
  
  resources :refresher_courses

  match '/refresher_instructions' => 'refresher_courses#instructions'

  match '/refresher_registered/:id' => 'refresher_courses#registered'

  match '/refresher_record' => 'refresher_courses#record'

  resources :orientation_courses

  match '/orientation_instructions' => 'orientation_courses#instructions'

  match '/orientation_registered/:id' => 'orientation_courses#registered'

  match '/orientation_record' => 'orientation_courses#record'

  resources :interaction_programs

  match '/interaction_instructions' => 'interaction_programs#instructions'

  match '/interaction_registered/:id' => 'interaction_programs#registered'

  match '/interaction_record' => 'interaction_programs#record'

  resources :principal_workshops

  match '/workshop_instructions' => 'principal_workshops#instructions'

  match '/workshop_registered/:id' => 'principal_workshops#registered'

  match '/workshop_record' => 'principal_workshops#record'
  
  root to: 'static_pages#index'

  match '/index' => 'static_pages#index'

  match '/about' => 'static_pages#about'

  match '/contact' => 'static_pages#contact'

  match '/dd_search' => 'static_pages#dd_search'

  match '/dd_result' => 'static_pages#dd_result'

  match '/faq' => 'static_pages#faq'

  match '/program' => 'static_pages#programs'

  match '/search' => 'static_pages#search'

  match '/result' => 'static_pages#result'

  match '/welcome' => 'static_pages#welcome'

  match '/admin' => 'admin#index'

  match '/developers' => 'static_pages#developers'
end
