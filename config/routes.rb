Rails.application.routes.draw do
  root "testings#index"
  resources :students do
    resources :ranks
  end
  resources :testings do
    get "/scores", :to => "testings#score"
    post "/scores", :to => "testings#processing"
    get "/reports", :to => "testings#report"
    resources :participants
  end

  resources :available_ranks
  resources :inventory
  resources :transactions

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
