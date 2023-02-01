# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    unauthenticated { root to: "showcase_site#landing", as: :unauthenticated_root }
    # unauthenticated { root to: "devise/sessions#new", as: :unauthenticated_root }

    resource :profile, only: [:edit, :update], controller: :profile

    authenticate :user, -> (user) { user.admin? || user.maintainer? } do
      draw :maintenance
    end

    authenticate :user, -> (user) { user.admin? || user.maintainer? } do
      draw :admin
    end

    root "feed#show"
    resource :feed, only: [:show], controller: :feed
    resources :bottles, except: :destroy
    resources :producers, except: :destroy
    resources :labels, only: [:destroy]
    resource :map, only: [:show], controller: :map
  end

  get "landing", to: "showcase_site#landing"
end
