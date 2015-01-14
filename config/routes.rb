AscDavv::Application.routes.draw do
  devise_for :admins, :controllers => { :registrations => 'registration' }, :skip => [:sessions]
  as :admin do
    get 'signin' => 'devise/sessions#new', :as => :new_admin_session
    post 'signin' => 'devise/sessions#create', :as => :admin_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_admin_session
    get 'signup' => 'registration#new', :as => :new_admin_registration
    get 'edit' => 'registration#edit', :as => :edit_admin_registration
  end

  resources :courses

  resources :refresher_courses

  resources :shortterm_courses

  resources :interaction_programs
  
  root to: 'static_pages#index'

  match '/index' => 'static_pages#index'

  match '/about' => 'static_pages#about'

  match '/contact' => 'static_pages#contact'

  match '/faq' => 'static_pages#faq'

  match '/program' => 'static_pages#programs'

  match '/welcome' => 'static_pages#welcome'

  match '/admin' => 'admin#index'
end
