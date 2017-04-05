Rails.application.routes.draw do
  resources :bookings, only: [:create]

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'college_apps/new'

  # get 'college_apps/show'

  root to: 'pages#home'

  # devise_for :users

  devise_for :users, :controllers => { registrations: 'registrations' }
  post "students", to: "students#create", as: "create_student"
#counselor routes
  resources :students, only: [:show, :new, :index] do
    resources :college_apps, only: [:new, :show, :create, :edit, :update, :destroy] do
      resources :tasks, only: [:new, :create, :edit, :update, :destroy] do
        member do
          post "/attach_file", to: "tasks#attach_file"
          post :approve
        end
      end
    end
  end
#student routes
  resources :college_apps, only: [:show, :create, :new, :index, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy] do
      member do
        post "/attach_file", to: "tasks#attach_file"
        post :pending
      end
    end
  end
end
