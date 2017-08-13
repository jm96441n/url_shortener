Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'urls#new'

  resources :urls, only: [ :new, :create, :index, :show ]

  get '/:shortened' => 'redirects#show'
end
