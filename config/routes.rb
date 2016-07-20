Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    root 'gitapi#index'


    get 'repos/:user' => 'gitapi#show', as: :show

end
