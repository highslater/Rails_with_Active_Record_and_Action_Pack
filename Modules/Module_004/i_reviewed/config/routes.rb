Rails.application.routes.draw do
  get 'dotes/create'

  get 'dotes/destroy'

  resources :books do
    resources :notes, only: [:create, :destroy]
  end
  root to: "books#index"
end
