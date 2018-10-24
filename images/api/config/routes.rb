Rails.application.routes.draw do
  namespace :api do
    resources :employees
    get 'version' => 'version#version'
  end
end
