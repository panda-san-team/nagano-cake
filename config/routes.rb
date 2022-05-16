Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    resource :customers, only: [:show,:edit,:update]
    get '/customers/quit' => 'customers#quit'
    get '/customers/out' => 'customers#out'

    resources :addresses, only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items, only: [:index,:update,:destroy,:create] do
      collection do
        delete '/destroy_all' => 'cart_items#destroy_all'
      end
    end
    resources :orders, only: [:new,:create,:index,:show] do
      post '/confirm' => 'orders#confirm'
      get '/thanks' => 'orders#thanks'
    end

    resources :items, only: [:index,:show]
    root to: 'items#top'
    get '/about' => 'items#about'

  end

  namespace :admin do
    resources :customers, only: [:index,:show,:update,:edit]
    resources :orders, only: [:index,:show,:update]
    resources :items, only: [:index,:create,:new,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
