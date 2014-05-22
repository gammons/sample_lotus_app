require File.expand_path("../application", __FILE__)

use Rack::Session::Cookie, secret: ENV.fetch('RACK_SECRET')
use Rack::MethodOverride
#run SampleApp

require 'sprockets'
require 'pry'
map '/assets' do
  e = Sprockets::Environment.new
  e.logger = Logger.new(STDOUT)
  e.append_path 'app/assets/javascripts'
  e.append_path 'app/assets/stylesheets'
  e.append_path 'app/assets/vendor/javascripts'
  e.append_path 'app/assets/vendor/stylesheets'
  run e
end

map '/' do
  run SampleApp
end
