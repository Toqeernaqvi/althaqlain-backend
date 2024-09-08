Rails.application.routes.draw do
  devise_for :admins

  resources :hotels do
    delete 'delete_image/:image_id', action: :delete_image, as: 'delete_image', on: :member
  end
  namespace :api do
    resources :hotels, only: [:index, :show]
    post '/subscribe', to: 'subscriptions#create'
    post 'contact', to: 'contacts#create'
  end

  root 'hotels#index'
end
