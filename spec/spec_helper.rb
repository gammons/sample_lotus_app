$LOAD_PATH.unshift __dir__ + '/..'
ENV['RACK_ENV'] ||= 'test'
require 'application'

Bundler.require(:default, :test)

require 'minitest/spec'
require 'minitest/autorun'
require 'lotus/model/adapters/memory_adapter'

Application.setup_adapter do
  name :test
  type Lotus::Model::Adapters::MemoryAdapter
  mapper :default
end
