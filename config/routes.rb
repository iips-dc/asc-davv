AscDavv::Application.routes.draw do
  resources :interaction_programs

  resources :courses

  resources :refresher_courses

  resources :shortterm_courses

  root to: 'static_pages#index'

  match '/index' => 'static_pages#index'

  match '/about' => 'static_pages#about'

  match '/contact' => 'static_pages#contact'

  match '/faq' => 'static_pages#faq'
end
