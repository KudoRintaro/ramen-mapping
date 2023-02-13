Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

   scope module: :public do
    root to: "homes#top"
    resources :shops, :except => :destroy
    get "users/my_page" => "users#show"
    get "users/infomation/edit" => "users#edit"
    patch "users/infomation/edit" => "users#update"
    get "/withdraw" => "users#confirm_withdraw"
    patch "/withdraw" => "users#withdraw"
    resources :genres, only: [:new, :create]
    resources :favorite_shops, only: [:index, :create]
    resources :comments, only: [:create, :destroy]
  end

  namespace :admin do
    get "" => "homes#top"
    resources :users, :except => :destroy do
      member do
        get "/withdraw" => "users#confirm_withdraw"
        patch "/withdraw" => "users#withdraw"
      end
    end
    resources :genres, only: [:index, :create, :destroy]
    resources :shops, :except => [:create, :destroy]
    resources :comments, only: [:index, :show, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
