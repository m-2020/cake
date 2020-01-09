Rails.application.routes.draw do

root 'customers/products#top'

patch '/customers' => 'customers/customers#change'
put '/customers' => 'customers/customers#change'
get '/customers/withdraw' => 'customers/customers#withdraw'

delete '/carts/:id' => 'customers/carts#destroy_all'

get '/orders/thanks' => 'customers/orders#thanks'
get '/orders/judgement' => 'customers/orders#judgement'

get '/admins/orders/top' => 'admins/orders#top'


namespace :admins do
	resources :customers,only: [:index, :show, :edit, :update]
	resources :products,only: [:index, :new, :create, :show, :edit, :update]
	resources :genres,only: [:index, :create, :edit, :update]
	resources :orders,only: [:index, :show, :update]
end

scope module: :customers do
	resource :customers,only: [:show, :edit, :update]
	resources :products,only: [:index, :show]
	resources :addresses,only: [:index, :new, :create, :edit, :update, :destroy]
	resources :carts,only: [:index, :create, :update, :destroy]
	resources :orders,only: [:index, :new, :create, :show]
end


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




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
