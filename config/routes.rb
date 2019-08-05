Rails.application.routes.draw do
  root "testings#index"
  resources :students
  resources :testings do
    get "/scores", :to => "testings#score"
    post "/scores", :to => "testings#processing"
    resources :participants
  end

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
