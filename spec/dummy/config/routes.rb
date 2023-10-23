# frozen_string_literal: true

Rails.application.routes.draw do
  mount Fusion::Engine => '/api/v4'
end
