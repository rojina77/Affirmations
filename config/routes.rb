Rails.application.routes.draw do
  # Define routes for emotions and affirmations controllers
  resources :emotions
  resources :affirmations
  
  # Set the root path of your application
  root 'home#index'

  delete '/affirmations/:id', to: 'affirmations#destroy'
  delete '/emotions/:id', to: 'emotions#destroy'
end

