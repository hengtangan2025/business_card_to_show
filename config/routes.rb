Rails.application.routes.draw do

  resources :cards
  resources :users
  resources :messages do
    collection do
      get :user_msgs
    end
  end
  
  root 'sessions#new'
  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy', as: :logout

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :articles 

end
