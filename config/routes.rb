Rails.application.routes.draw do
  devise_for :counselors
  devise_for :students
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
