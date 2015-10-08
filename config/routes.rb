require "sidekiq/web"
Rails.application.routes.draw do
  root "static_pages#home"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users

  resources :subjects, only: [:index] do
    resources :exams
  end
  resources :questions

  mount Sidekiq::Web, at: "/sidekiq"
end
