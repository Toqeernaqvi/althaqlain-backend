Rails.application.routes.draw do
  devise_for :admins

  resources :hotels do
    resources :reviews, only: [:create, :update, :destroy]
    delete 'delete_image/:image_id', action: :delete_image, as: 'delete_image', on: :member

  end

  root 'hotels#index'
end
