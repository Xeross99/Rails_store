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

  # START HIGHLIGHT
  resources :support_requests, only: %i[ index update ]
  # END HIGHLIGHT

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do 
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
end



# INFO

# RESOURCES -> mozliwe sa wykonanie akcji CRUD - create, read, update, delete
# SCOPE '(:LOCALE)' DO -> wpisane w niej trasy beda obejmowac parametry :locale do  okreslenia jezyka 
# VIA: :ALL -> ścieżka jest dostępna dla wszystkich typów żądań HTTP.