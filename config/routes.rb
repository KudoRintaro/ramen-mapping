Rails.application.routes.draw do
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/destroy'
  end
  namespace :admin do
    get 'shops/index'
    get 'shops/show'
    get 'shops/edit'
    get 'shops/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/confirm_withdraw'
    get 'users/withdraw'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/confirm_withdraw'
    get 'users/withdraw'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'favorite_shops/index'
    get 'favorite_shops/create'
  end
  namespace :public do
    get 'shops/new'
    get 'shops/create'
    get 'shops/index'
    get 'shops/show'
    get 'shops/edit'
    get 'shops/update'
  end
  namespace :public do
    get 'genres/index'
    get 'genres/create'
  end

  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
