Rails.application.routes.draw do

  get '/game' => 'game#try'
  get '/adam_is_awesomeSauce' => 'game#adam'

end
