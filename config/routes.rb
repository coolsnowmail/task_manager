Rails.application.routes.draw do

  get 'users/show_user'
  get 'users/show_admin'
  get 'admit_edit', to: 'tasks#admit_edit'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'tasks#index'
  resources :tasks
end
