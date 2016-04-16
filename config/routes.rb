Rails.application.routes.draw do
  root 'todo_lists#index'

  resources :todo_lists do
    collection do
      post 'sort'
    end
#    member do
#      post 'sort'
#    end
    resources :todo_items do
      collection do
        post 'sort'
      end
      member do
          post 'completed'
      end
    end
  end
end
