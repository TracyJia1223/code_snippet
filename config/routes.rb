Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index', as: :root

  resources :snippets, shallow: true do
    resources :kinds
  end

  get 'kind/:id' => 'snippets#subindex', as: :language
  get '/signup' => 'users#new'
  resources :users, except: [:new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


end
