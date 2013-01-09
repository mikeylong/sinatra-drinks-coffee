require 'sinatra'
require 'haml'
require 'coffee-script'
require 'thin'

set :server, 'thin'

connections = []

get '/' do
  halt haml(:login) unless params[:person]
  haml :chat, :locals => { :person => params[:person].gsub(/\W/, '') }
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

# get '/screen.css' do
#   sass :screen
# end
