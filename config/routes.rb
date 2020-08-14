Rails.application.routes.draw do
	devise_for :users

	devise_for :admins, controllers: {
		sessions: "admins/sessions",
		passwords: "admins/passwords"
	}

	root to: "homes#top"
	get "home/about", to: "homes#about"

	resources :users, only:[:show, :index, :edit, :update]

	resources :posts, except:[:edit, :update] do
		resources :post_comments, only:[:create, :destroy]
		resources :likes, only:[:create, :destroy]
	end


    namespace :admins do
		get "top", to: "users#top"

    	resources :users, only:[:index, :edit, :update]

    	resources :tags
    end
end

