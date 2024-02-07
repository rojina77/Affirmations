Rails.application.routes.draw do
  # Define routes for emotions and affirmations controllers
  resources :emotions
  resources :affirmations
  
  # Set the root path of your application
  root 'emotions#index'
end

