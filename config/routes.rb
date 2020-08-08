Rails.application.routes.draw do
	devise_for :users

	devise_for :admins, controllers: {
		sessions: "admins/sessions",
		passwords: "admins/passwords"
	}

	root to: "homes#top"
	get "home/about", to: "homes#about"

	resources :posts, except:[:edit, :update]

	resources :users, only:[:show, :edit, :update]

    namespace :admins do
    	resources :tags

    	get "top", to: "users#top"
    	resources :users
    end
end

