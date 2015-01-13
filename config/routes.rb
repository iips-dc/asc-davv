AscDavv::Application.routes.draw do
  devise_for :admins

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
end
