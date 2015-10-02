Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users

  resources :subjects, only: [:index] do
    resources :exams
  end
  resources :questions, only: [:index]

  namespace :admin do
    resources :subjects
    resources :questions
  end
end
