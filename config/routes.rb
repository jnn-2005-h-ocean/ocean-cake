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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
