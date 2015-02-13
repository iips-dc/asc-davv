AscDavv::Application.routes.draw do
  
  resources :resource_people


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
  resources :refresher_courses

  match '/refresher_record' => 'refresher_courses#record'

  resources :shortterm_courses

  match '/shortterm_record' => 'shortterm_courses#record'

  match '/registered' => 'shortterm_courses#registered'
  
  resources :orientation_courses

  match '/orientation_record' => 'orientation_courses#record'

  resources :interaction_programs

  match '/interaction_record' => 'interaction_programs#record'
  
  root to: 'static_pages#index'

  match '/index' => 'static_pages#index'

  match '/about' => 'static_pages#about'

  match '/contact' => 'static_pages#contact'

  match '/faq' => 'static_pages#faq'

  match '/program' => 'static_pages#programs'

  match '/welcome' => 'static_pages#welcome'

  match '/admin' => 'admin#index'
end
