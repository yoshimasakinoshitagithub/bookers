Rails.application.routes.draw do
  root 'books#top'

  get 'books' => 'booklists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'books#top'

  post 'books' => 'booklists#create'

  get 'booklists' => 'booklists#index'

  get 'books/:id' => 'booklists#show', as: 'book'

  get 'books/:id/edit' => 'booklists#edit', as: 'edit_book'

  patch 'books/:id' => 'booklists#update', as: 'update_book'

  delete 'books/:id' => 'booklists#destroy', as: 'destroy_book'
end
