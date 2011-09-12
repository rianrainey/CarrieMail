CarrieMail::Application.routes.draw do

  resources :catalogs do
    resources :notes do
      member do
        get 'generate_pdf'
        get 'success'
      end
    end
  end

# re-route 'users' to 'accounts'. Map default path names to new names
  devise_for :users, :path => 'accounts' , 
              :path_names => { :sign_in => 'login', :sign_out => 'logout' }, 
              :controllers => {:registrations => "registrations", :sessions => "sessions"}
  
  resources :users do 
    resources :recipients
  end
  
  match 'home' => 'home#index'
  
  # route to list of recently sent letters after successful logon
  root :to => "home#index"
  
end
