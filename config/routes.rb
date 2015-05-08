Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  scope '/men' do
    resources :jerseys, :controller => 'men/jerseys'
    resources :jackets, :controller => 'men/jackets'
    resources :shirts, :controller => 'men/shirts'
    resources :bottoms, :controller => 'men/bottoms'
    resources :accessories, :controller => 'men/accessories'
    resources :baselayers, :controller => 'men/baselayers'
  end

  scope '/women' do
    resources :jerseys, :controller => 'women/jerseys', as: 'women_jersey'
    resources :jackets, :controller => 'women/jackets', as: 'women_jacket'
    resources :shirts, :controller => 'women/shirts', as: 'women_shirt'
    resources :bottoms, :controller => 'women/bottoms', as: 'women_bottoms'
    resources :accessories, :controller => 'women/accessories', as: 'women_accessories'
    resources :baselayers, :controller => 'women/baselayers', as: 'women_baselayers'
  end

  resources :men, :women, :video, :events, :brand, :contact, :products, :inventories

  resources :admin, shallow: true do
    resources :product_images
  end

  resource :basket, only: [:show] do
    resources :payments
    resources :delivery
    resources :confirmation
  end

  resources :order_items, only: [:create, :update, :destroy]

end
