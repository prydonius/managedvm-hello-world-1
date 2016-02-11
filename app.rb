require 'sinatra'

class HelloApp < Sinatra::Base
  configure do
    enable :logging
    file = File.new("/var/log/app_engine/custom_logs/app.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
  end

  get '/' do
    'pizza is awesome'
  end

  get '/ping' do
    "pong"
  end

  # Health checked for gce
  get '/_ah/health' do
    "pong"
  end

  get '/_ah/start' do
    "ok"
  end

  get '/_ah/stop' do
    "ok"
  end
end
