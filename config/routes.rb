Rails.application.routes.draw do

  get 'users/show_user'
  get 'users/show_admin'
  get 'admin_edit', to: 'tasks#admin_edit'
  get 'admin_new', to: 'tasks#admin_new'
  get 'admin_show', to: 'tasks#admin_show'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'tasks#index'
  resources :tasks
end
