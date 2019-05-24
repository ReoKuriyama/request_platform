Rails.application.routes.draw do
  resources :requests
  resources :request_categories, only: %i[index]
  resources :get_requests, only: %i[show]
  resources :tickets, only: %i[index update]
end
