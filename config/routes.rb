Rails.application.routes.draw do
  root 'todo_lists#index'

  match 'todo_items', to: 'todo_items#new', via: [:options]


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
