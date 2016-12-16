Rails.application.routes.draw do

  get '/search_schools' => "search_engins#search_school", :as => "search_schools"
  get '/search_events' => "search_engins#search_event", :as => "search_events"



  resources :individuals, :controller => "individuals", :only => [:show, :create, :destroy, :update, :new]

  resources :users

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  resource :session, controller: "sessions", only: [:create]

  resources :events

  resources :schools

  resources :transactions, only: [:create,:new]

  root 'welcome#index'

end
