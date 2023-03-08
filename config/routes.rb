Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'manager/dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :manager do
    root to: 'dashboard#index'
    resources :leads, only: %i[create show]
    resources :leases, only: %i[index show create]
    resources :units
    resources :invoices
  end

  namespace :receptionist do
    root to: 'dashboard#index'
  end

  namespace :renter do
    root to: 'dashboard#index'
  end
end
