Rails.application.routes.draw do

  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" },
      :controllers => { :registrations => "registrations" }

  resources :users, except: [:new]

  root to: 'pages#home'

end
