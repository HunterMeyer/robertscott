RobertScott::Application.routes.draw do
  resources  :messages

  root 'home#index'

end
