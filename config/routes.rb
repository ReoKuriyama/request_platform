Rails.application.routes.draw do
  resources :requests
  resources :request_categories, only: %i[index]
  resources :get_requests, only: %i[show]
  resources :tickets, only: %i[index update] do
    collection do
      get ':id/reclassify', action: :reclassify
      patch ':id/classify', action: :classify
    end
  end
  resources :tags, only: %i[index]
end
