require 'sinatra'
require 'thin'
require 'haml'

Dir[File.dirname(__FILE__) + '/app/*.rb'].each {|file| require file }

configure do
  set :haml, { :format => :html5 }
  set :server, 'thin'
end
