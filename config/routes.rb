# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'about', to: 'about#index', as: :about

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'sign_up', to: 'registrations#new', as: :sign_up
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new', as: :sign_in
  post 'sign_in', to: 'sessions#create'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'

  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  delete 'log_out', to: 'sessions#destroy'

  root to: 'main#index'
end
