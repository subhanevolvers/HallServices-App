Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth' , controllers: {
    sessions: 'api/v1/auth/sessions'
  }
end
