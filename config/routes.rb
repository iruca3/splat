Rails.application.routes.draw do
  root 'game#index'
  post 'game/:position/put/:direction' => 'game#put', as: :put
  put 'game/:position/rotate/:direction' => 'game#rotate', as: :rotate
  post 'game/:position/splat' => 'game#splat', as: :splat

  post 'game/new' => 'game#new', as: :new_game
end
