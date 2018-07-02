
Rails.application.routes.draw do
  resources :doctors_reviews
  #
  # , only: [:index]
  # post resources :doctors_reviews, only: [:create], to: 'doctors_reviews/new'
end
