require 'sinatra'
require 'haml'

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

__END__

@@ layout
%html
  %head
    %title
      Super Simple Chat with Sinatra
    %meta{charset: "utf-8"}
    %script{src: "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"}
  %body
    = yield
