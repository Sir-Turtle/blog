Rails.application.routes.draw do
	
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "posts#index"
  
  	resources :posts do
  		put 'publish', on: :member, as: :publish
  		resources :comments
	end

	get '/about', to: 'pages#about'

	devise_for :users, path_names: {
		sign_in: 'login', sign_out: 'logout',
		password: 'secret', confirmation: 'verification',
		registration: 'register', edit: 'edit/profile'
	}

end
