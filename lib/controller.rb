require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  #Création d'un nouveau potin
  get '/gossips/new/' do
    erb :new_gossip
  end

  #Sauvegarde du potin et redirection vers page d'accueuil
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  
  #Find ?
  get '/gossips/:id' do
		erb :show, locals: {gossip: Gossip.all[params[:id].to_i ], id: params[:id].to_i}
  end



end

