Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'
  root to: "members#index"

  get 'member', to: 'members#index'
  get 'admin', to: 'admins#index'
  devise_for :users
  
end
