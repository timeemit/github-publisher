require 'sinatra'
require './uploader'

put '/*' do
  path = params[:splat].first
  body = request.body.read
  Uploader.upload(path, body)
  nil
end
