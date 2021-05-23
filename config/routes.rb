Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles do
    get '/unpublished', to: 'articles#unpublished', on: :collection
    resources :comments
  end


end
