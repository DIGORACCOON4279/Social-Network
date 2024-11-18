Rails.application.routes.draw do
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'
  # devise_for :users
  # root to: 'home#index'
  # get 'home/index'

# ----------------------------------
#   # Rutas de Devise para login, signup, etc.
#   devise_for :users

#   # Página de inicio (home) visible para todos
#   root to: 'pages#home'

#   # Si el usuario está autenticado, lo redirigimos a la página de bienvenida (dashboard)
#   authenticated :user do
#     root to: 'pages#dashboard', as: :authenticated_root
#   end

#   # Rutas para las otras páginas estáticas
#   get 'about', to: 'pages#about'
#   get 'contact', to: 'pages#contact'


# ------------------------------

devise_for :users  # Devise para autenticación (login, signup)

  # Si el usuario está logueado, va al 'home#index' (bienvenida)
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  # Si no está logueado, redirige a la página pública 'pages#home' (por ejemplo, el inicio)
  root to: 'pages#home'

  # Otras rutas estáticas
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'





  # Otros ruteos

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
