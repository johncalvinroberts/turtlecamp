Rails.application.routes.draw do
  get 'tasks/new'

  get 'tasks/create'

  get 'tasks/edit'

  get 'tasks/update'

  get 'tasksnew/create'

  get 'tasksnew/edit'

  get 'tasksnew/update'

  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students , only: [:show, :create, :new, :index] do
    resources :applications, only: [:new, :show, :create] do
      resources :tasks, only: [:new, :create, :edit, :update] do
        member do
          post "/attach_file", to: "tasks#attach_file"
        end
      end
    end
  end
  resources :applications, only: [:show, :create, :new, :index] do
    resources :tasks, only: [:new, :create, :edit, :update] do
      member do
        post "/attach_file", to: "tasks#attach_file"
      end
    end
  end
  devise_for :counselors
  devise_for :students
end
