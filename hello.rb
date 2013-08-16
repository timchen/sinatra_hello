require 'rubygems'
require 'sinatra'

get '/' do
  "Hello! The current time is #{Time.now.strftime('%H:%M')}"
end
