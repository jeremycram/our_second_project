Rails.application.routes.draw do




  root 'shops#index'


  post '/shop/:shop_id/cart', to: 'carts#create', as: 'new_shop_cart'
  resources :shops do
    resources :carts
  end

  resources :carts

end
