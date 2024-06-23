Rails.application.routes.draw do
  devise_for :admins

  resources :hotels do
    resources :reviews, only: [:create, :update, :destroy]
  end

  root 'hotels#index'
end
