Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'college_apps/new'

  # get 'college_apps/show'

  root to: 'pages#home'

  devise_for :users

  post "students", to: "students#create", as: "create_student"

  resources :students, only: [:show, :new, :index] do
    resources :college_apps, only: [:new, :show, :create, :edit, :update, :destroy] do
      resources :tasks, only: [:new, :create, :edit, :update, :destroy] do
        member do
          post "/attach_file", to: "tasks#attach_file"
        end
      end
    end
  end
  resources :college_apps, only: [:show, :create, :new, :index, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy] do
      member do
        post "/attach_file", to: "tasks#attach_file"
      end
    end
  end
end
