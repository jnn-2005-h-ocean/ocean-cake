Rails.application.routes.draw do
	devise_for :admins, controllers: {
		sessions:      'admins/sessions',
		passwords:     'admins/passwords',
		registrations: 'admins/registrations'
	}

    devise_scope :admins do
		get 'admins/sign_in' => 'admins/sessions#create'
		get 'admins/sign_out' => 'admins/sessions#destroy'
    end

	devise_for :customers, controllers: {
	  	sessions:      'customers/sessions',
	  	passwords:     'customers/passwords',
	  	registrations: 'customers/registrations'
	}

    devise_scope :customers do
		get 'customers/sign_in' => 'customers/sessions#create'
		get 'customers/sign_out' => 'customers/sessions#destroy'
    end



# productsとgenresにdestroyを入れるか？
# # serchはどうするか?

    namespace :admins do
		resources :customers, only:[:index, :show, :edit, :update]
		resources :products
		resources :orders, only: [:index, :show, :update]
		resources :order_items, only: [:update]
		resources :genres, only: [:index, :create, :edit, :update, :destroy]
		root 'homes#top'
	end



# pacthのdeleteをどうするか？
# orderのupdate
# order_itemsは？
# serchはどうするか?

	namespace :customers do
		resources :customers, only:[:show, :edit, :update]do
			member do
				get :delete, as: :delete
				patch :delete, as: :active
			end
			resources :orders, only:[:new, :create]do
				member do
					get :confirm, as: :confirm
					# post :confirm, as: :confirm
					get :complete, as: :complete
				end
			end
			resources :cart_items, only:[:show, :update, :destroy, :create]
			delete '/customers/:customer_id/cart_items_alldestroy' => 'cart_items#alldestroy', as: :alldestroy
			resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]
		end


		resources :products, only: [:index, :show]

		# serchはどうするか?


		root 'homes#top'

	end







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
