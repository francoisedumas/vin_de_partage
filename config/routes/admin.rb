# frozen_string_literal: true

require "sidekiq/web"

root to: "admin/base#index" , as: "admin_authenticated_root"

namespace :admin do
  get "/", controller: :base, action: :index
  resources :users
end
