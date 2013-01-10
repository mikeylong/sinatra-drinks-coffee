require 'sinatra'
require 'thin'
require 'haml'
require 'coffee-script' if development?
require 'susy'

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/app")
Dir.glob("#{File.dirname(__FILE__)}/app/*.rb") { |app| require File.basename(app, '.*') }

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options

  set :server, 'thin'
end

get '/stylesheets/screen.css' do
  sass :'stylesheets/screen'
end
