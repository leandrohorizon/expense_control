# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  root to: 'home#index'
end
