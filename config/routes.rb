require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :requests do
    collection do
      post 'search', action: :search
    end
  end
  resources :request_categories, only: %i[index]

  resources :tickets, only: %i[index update] do
    collection do
      get ':id/reclassify', action: :reclassify
      patch ':id/classify', action: :classify
    end
  end
  resources :tags, only: %i[index]
end
