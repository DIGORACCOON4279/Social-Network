#Rails.application.routes.draw do
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
#end

# ------------------------------

# Rails.application.routes.draw do

# devise_for :users  # Devise para autenticación (login, signup)

#   # Si el usuario está logueado, va al 'home#index' (bienvenida)
#   authenticated :user do
#     root to: 'home#dashboard', as: :authenticated_root
#   end

#   # Si no está logueado, redirige a la página pública 'pages#home' (por ejemplo, el inicio)
#   root to: 'pages#home', as: :unauthenticated_root

#   # Otras rutas estáticas
#   get 'about', to: 'pages#about'
#   get 'contact', to: 'pages#contact'


#   # Otros ruteos

#   # Health check route
#   get "up" => "rails/health#show", as: :rails_health_check
# end

# Rails.application.routes.draw do
#   devise_for :users

#   # Rutas para usuarios autenticados
#   authenticated :user do
#     # Redirige al dashboard cuando el usuario está autenticado
#     root to: 'home#dashboard', as: :authenticated_root

#     # Ruta para editar el perfil del usuario
#     get 'dashboard/mi_perfil', to: 'users#edit', as: :edit_user_profile
#     patch 'dashboard/mi_perfil', to: 'users#update', as: :update_user_profile
#   end

#   # Página de inicio pública si el usuario no está autenticado
#   unauthenticated do
#     root to: 'pages#home', as: :unauthenticated_root
#   end

#   # Otras rutas estáticas
#   get 'about', to: 'pages#about'
#   get 'contact', to: 'pages#contact'
# end

# Rails.application.routes.draw do
#   devise_for :users

#   # Rutas para usuarios autenticados
#   authenticated :user do
#     root to: 'home#dashboard', as: :authenticated_root
#   end

#   # Página de inicio pública si el usuario no está autenticado
#   unauthenticated do
#     root to: 'pages#home', as: :unauthenticated_root
#   end

#   # Rutas adicionales
#   get 'about', to: 'pages#about'
#   get 'contact', to: 'pages#contact'
# end

# Rails.application.routes.draw do
#   devise_for :users

#   # Rutas para usuarios autenticados
#   authenticated :user do
#     root to: 'home#dashboard', as: :authenticated_root
#   end

#   # Página de inicio pública si el usuario no está autenticado
#   root to: 'pages#home', as: :unauthenticated_root

#   # Rutas adicionales
#   get 'about', to: 'pages#about'
#   get 'contact', to: 'pages#contact'
# end

# Rails.application.routes.draw do
#   devise_for :users

#   # Rutas para usuarios autenticados
#   authenticated :user do
#     root to: 'home#dashboard', as: :authenticated_root
#   end

#   # Página de inicio pública si el usuario no está autenticado
#   unauthenticated do
#     root to: 'pages#home', as: :unauthenticated_root
#   end

#   # Rutas adicionales
#   get 'about', to: 'pages#about'
#   get 'contact', to: 'pages#contact'
# end

# -------------------- Estas fueron las ultimas que me sirvieron antes de crear perfil --------------------------------

Rails.application.routes.draw do
  devise_for :users

  # Rutas para usuarios autenticados
  authenticated :user do
    root to: 'home#dashboard', as: :authenticated_root
  end

  # Página de inicio pública si el usuario no está autenticado
  unauthenticated do
    root to: 'pages#home', as: :unauthenticated_root
  end

  # Ruta para el dashboard
  get 'dashboard', to: 'home#dashboard', as: :dashboard

  # Rutas adicionales
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end

