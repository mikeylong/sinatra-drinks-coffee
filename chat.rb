require 'sinatra'
require 'haml'
require 'coffee-script'
require 'thin'

require "sinatra/reloader" if development?
# use Rack::LiveReload

set :server, 'thin'

connections = []

get '/' do
  halt haml(:login) unless params[:user]
  haml :chat, :locals => { :user => params[:user].gsub(/\W/, '') }
end

get '/stream', :provides => 'text/event-stream' do
  stream :keep_open do |out|
    connections << out
    out.callback { connections.delete(out) }
  end
end

post '/' do
  connections.each { |out| out << "data: #{params[:msg]}\n\n" }
  204 # response without entity body
end

get '/chat.js' do
  coffee :chat
end