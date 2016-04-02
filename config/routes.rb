Rails.application.routes.draw do
  root 'todo_lists#index'

  resources :todo_lists do
    member do
      post 'sort'
    end
    resources :todo_items do
      member do
          post 'completed'
        end
    end
  end
end
