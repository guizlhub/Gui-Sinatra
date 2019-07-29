require 'gossip'
require 'pry'

class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["author"], params["content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :id, locals: {nb_id: params["id"]}
  end
 
  post '/gossips/:id' do
    Gossip.find ["id"]
  end
  
end