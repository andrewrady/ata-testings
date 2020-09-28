Rails.application.routes.draw do
  devise_for :users

  root "testings#index"
  resources :students do
    resources :waivers, only: [:new, :create]
    resources :ranks
    resources :pos_records do
      resources :charges
    end
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

    resources :inventory do
      post 'search', on: :collection
    end
    resources :pos_records, only: [:create]
  end

  resources :available_ranks
  resources :inventory
  resources :pos_records, except: [:create]
end
