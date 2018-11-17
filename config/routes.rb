Rails.application.routes.draw do
  get 'kittens/index'
  get 'kittens/show'
  get 'kittens/new'
  get 'kittens/create'
  get 'kittens/edit'
  get 'kittens/update'
  get 'kittens/destroy'
  delete 'delete_kitten', to: "kittens#destroy"
  delete 'delete_kitten', to: "kittens#destroy"
  root 'kittens#index'
 resources :kittens
end
