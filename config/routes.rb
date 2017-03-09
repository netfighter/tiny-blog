Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, controller: 'registrations'

  mount ActionCable.server => '/cable'

  root to: 'posts#index'

  %w( 403 404 422 500 ).each do |code|
    get code, :to => "errors#show", :status_code => code
  end
end
