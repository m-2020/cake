Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

root 'customers/products#top'

patch '/customers' => 'customers/customers#change'
put '/customers' => 'customers/customers#change'
get '/customers/withdraw' => 'customers/customers#withdraw'

delete '/cart_produsts/' => 'customers/cart_products#destroy_all'

get '/orders/thanks' => 'customers/orders#thanks'
get '/orders/judgement' => 'customers/orders#judgement'

get '/admins/orders/top' => 'admins/orders#top'
get '/customers/myedit' => 'customers/customers#edit'
patch '/customers/update' => 'customers/customers#update'


namespace :admins do
	resources :customers,only: [:index, :show, :edit, :update]
	resources :products,only: [:index, :new, :create, :show, :edit, :update]
	resources :genres,only: [:index, :create, :edit, :update]
	resources :orders,only: [:index, :show, :update]
end

scope module: :customers do
	resource :customers,only: [:show, :update]
	resources :products,only: [:index, :show]
	resources :addresses,only: [:index, :new, :create, :edit, :update, :destroy]
	resources :cart_products,only: [:index, :create, :update, :destroy]
	resources :orders,only: [:index, :new, :create, :show]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
