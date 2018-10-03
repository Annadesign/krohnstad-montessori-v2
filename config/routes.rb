Rails.application.routes.draw do

  root to: 'posts#index'
 
 # === ADMINISTRATOR ===
  get '/admin' => 'admin/sessions#new'
  get '/login' => 'admin/sessions#index'
  get '/logout' => 'admin/sessions#destroy'

  get 'admin/images/list' => 'admin/images#list'
  get 'admin/photos/list' => 'admin/photos#list'

  namespace :admin do
  	resources :dashboard, only: [:index]
    resources :sessions, only: [:index, :create, :destroy]
    resources :moderators, only: [:index, :new, :create, :edit, :update]
    resources :employees, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :articles do
      collection do
        patch :reorder
      end
    end
    resources :schools, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :departments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :parents, only: [:index, :new, :create, :edit, :update, :destroy]
  	resources :children, only: [:index, :new, :create, :edit, :update, :destroy]
  	resources :messages, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :meetings, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :galleries, only: [:index, :new, :create, :show, :edit, :update, :destroy] 
      
    resources :images, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :photos, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :documents, only: [:index, :new, :create, :edit, :update, :destroy]
  end  
# === END ADMINISTRATOR ===

# === FORUM FORELDRE ===
  get '/forum' => 'sessions#new'
  get '/logginn' => 'sessions#index'
  get '/loggut' => 'sessions#destroy'

  resources :sessions, only: [:index, :create, :destroy]
  resources :parents, only: [:index, :edit, :update, :destroy]
  

  resources :avdeling, controller: 'departments'

  resources :barnehage, controller: 'barnehagen'
  resources :ommontessori, controller: 'ommontessori'
  resources :omoss, controller: 'satsingsomrade'
  resources :skole, controller: 'skole'
  resources :kontakt, controller: 'informasjon'
  resources :personvern, controller: 'articles'
    
  resources :galleries, only: [:show]

end
