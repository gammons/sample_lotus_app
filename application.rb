require 'rubygems'
require 'bundler'
require_relative 'lotus'
Bundler.require(:default)
require 'dotenv'

Dotenv.load

I18n.enforce_available_locales = false

if %w(development test).include? ENV.fetch('RACK_ENV')
  Lotus::Controller.handle_exceptions = false
end

Lotus::Controller.handled_exceptions = { Lotus::Model::EntityNotFound => 404 }

ApplicationRoot = Pathname.new(__FILE__).dirname

Dir.glob(ApplicationRoot.join('lib/**/*.rb')) { |file| require file }
Dir.glob(ApplicationRoot.join('app/*/*.rb')) { |file| require file }

Lotus::View.root = ApplicationRoot.join('app/templates')
Lotus::View.load!

Application = Lotus::Application.new

require_relative 'config/routes'
Dir.glob(ApplicationRoot.join('config/**/*.rb')) { |file| require file }
