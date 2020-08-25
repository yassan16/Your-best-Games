Rails.application.routes.draw do
	devise_for :users

	devise_for :admins, controllers: {
		sessions: "admins/sessions",
		passwords: "admins/passwords"
	}

	root to: "homes#top"
	get "home/about", to: "homes#about"
	get "search", to: "homes#search"

	resources :users, except:[:new, :create]

	resources :posts, except:[:edit, :update] do
		resources :post_comments, only:[:create, :destroy]
		resources :likes, only:[:create, :destroy]
	end

	resources :notifications, only:[:index]
	delete "notifications/destroy", to: "notifications#destroy_all"

    namespace :admins do
		get "top", to: "users#top"

    	resources :users, only:[:index, :edit, :update]

    	resources :tags
    end
end

