# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  root 'flights#index'
  get '/flights/:id', to: 'flights#show'
  patch '/flights', to: 'flights#update'
end
