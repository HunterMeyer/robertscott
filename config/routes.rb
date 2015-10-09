RobertScott::Application.routes.draw do
  devise_for :users
  resources  :messages

  root 'home#index'

end
