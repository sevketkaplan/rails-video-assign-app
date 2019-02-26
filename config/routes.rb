Rails.application.routes.draw do
	resources :password_resets, only: [ :new, :create]

	get '/password_resets/edit' => 'password_resets#edit', as: :edit_password_reset
	put '/password_resets/' => 'password_resets#update', as: :password_reset	
	resources :assigns
	authenticated :user, lambda { |u| u.admin? } do
		resources :videos	
	end

	authenticated :user, lambda { |u| u.admin==nil || u.admin==false } do
		resources :videos, :except=>[:show,:index]
	end
	devise_scope :user do
		root to: "devise/sessions#new"
	end
	devise_for :users, :controllers => { :registrations => 'registrations' } 
	resources :users, except: :create
	post 'create_user' => 'users#create', as: :create_user  
	post '/users/:id/edit', to: 'users#update'
	patch '/users/:id/edit', to: 'users#update'
end
