Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }, defaults: { format: :json }

  resources :leaves
  resources :positions
  resources :departments
  resources :attendances
  resources :payrolls
  resources :performances
  resources :recruitments
  resources :candidates
end
