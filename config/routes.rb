Rails.application.routes.draw do
  get 'static_pages/questions', as: 'questions'
  get 'static_pages/news', as: 'news'
  get 'static_pages/contact', as: 'contact'
  get 'admin' => 'admin#index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root 'store#index', as: 'store_index'
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end
end