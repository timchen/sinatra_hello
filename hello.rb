require 'rubygems'
require 'sinatra'

configure do
  file = File.new("requests.log", 'a+')
  use Rack::CommonLogger, file
end


get '/' do
  "Hello! The current time is #{Time.now.strftime('%H:%M')}"
end
