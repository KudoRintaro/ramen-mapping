Rails.application.routes.draw do
  namespace :public do
    get 'maps/index'
  end
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
#会員側ルーティング
   scope module: :public do
    root to: "homes#top"
    resources :shops do
     collection do
       get "/favorites" => "shops#favorite"
     end
      resource :favorite_shops, only: [:create, :destroy]
      resource :reviews, only: [:create, :update]
      resources :shop_comments, only: [:create, :destroy]
      resources :maps, only: [:index]
    end
    get "users/my_page" => "users#show"
    get "users/information/edit" => "users#edit"
    patch "users/information" => "users#update"
    put "users/information" => "users#update"
    get "users/shops" =>"users#index"
    get "users/withdraw" => "users#confirm_withdraw"
    patch "users/withdraw" => "users#withdraw"
    get "users/comments" => "users#comments"
    delete "users/comments" => "users#comment_destroy"
    resources :genres, only: [:new, :create, :show]
    get "genre_search" => "searches#genre_search"
    get "search" => "searches#name_search"
    get "rank" => "ranks#rank"
  end
#管理者側ルーティング
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
    resources :shop_comments, only: [:index, :show, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
