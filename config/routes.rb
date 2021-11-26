Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  post "/graphql", to: "graphql#execute"
  root to: 'react#home'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'registrations#logout'
  get :logged_in, to: 'sessions#logins'
end
