# frozen_string_literal: true

require "sidekiq/web"

root to: "maintenance/base#index", as: "maintainer_authenticated_root"

namespace :maintenance do
  mount Sidekiq::Web => "/sidekiq"
  get "/", controller: :base, action: :index
  resources :users
  resources :jobs, only: :index
end
