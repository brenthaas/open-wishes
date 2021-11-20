Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root to: 'static#home'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'registrations#logout'
  get :logged_in, to: 'sessions#logins'
end
