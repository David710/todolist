Rails.application.routes.draw do
  root 'todo_lists#index'

  controller 'todo_items' do
    match '*unmatched_route', :to => 'todo_items#route_options', via: [:options]
  end

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
