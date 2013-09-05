require 'rubygems'
require 'sinatra'

configure do
  file = File.new("requests.log", 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end


get '/' do
  "Hello! The current time is #{Time.now.strftime('%H:%M')}"
end
