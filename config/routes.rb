Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, only: [:create, :destroy, :update] do
    resources :sub_tasks, only: [:index, :create, :update, :destroy], shallow: true
  end
end
