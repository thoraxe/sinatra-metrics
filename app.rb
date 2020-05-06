# myapp.rb
require 'sinatra/base'
require 'prometheus/client'


class MyApp < Sinatra::Application
  # returns a default registry
  prometheus = Prometheus::Client.registry
  
  # create a new counter metric
  http_requests = Prometheus::Client::Counter.new(:http_requests, docstring: 'A counter of HTTP requests made')
  # register the metric
  prometheus.register(http_requests)

  get '/' do
    http_requests.increment
    'Hello world!'
  end
end