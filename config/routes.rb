Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

   scope module: :public do
    root to: "homes#top"
    resources :shops, :except => :destroy
    resource :users, :except => [:new, :index, :destroy] do
      member do
        get "/withdraw" => "users#confirm_withdraw"
        patch "/withdraw" => "users#withdraw"
      end 
    end 
  end

  namespace :admin do

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
