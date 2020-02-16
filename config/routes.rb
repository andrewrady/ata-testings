Rails.application.routes.draw do
  devise_for :users

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

  namespace :v1 do
    resources :students do
      post 'search', on: :collection
    end
  end

  resources :available_ranks
  resources :inventory
  resources :transactions
end
