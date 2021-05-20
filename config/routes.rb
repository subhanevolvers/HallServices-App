Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth' , controllers: {
    sessions: 'api/v1/auth/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
