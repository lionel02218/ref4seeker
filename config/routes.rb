Rails.application.routes.draw do
  # devise_for :views
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :comments
  root "questions#index"
  get "home/index"
  resources :questions do
    resources :favorites, only: [:create, :destroy, :update]
    resources :votes, only: [:create, :update, :destroy]
    resources :answers
    member do
      post :send_mail
    end
    collection do
      post :search
    end
  end
end
