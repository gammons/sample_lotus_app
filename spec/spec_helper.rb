$LOAD_PATH.unshift __dir__ + '/..'
ENV['RACK_ENV'] ||= 'test'
require 'application'

Bundler.require(:default, :test)

require 'minitest/spec'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require 'lotus/model/adapters/memory_adapter'

adapter = Application.setup_adapter do
  name :test
  type Lotus::Model::Adapters::MemoryAdapter
  mapper :default
end

Minitest::Spec.before do
  Application.mapper(:default).collections.each do |collection|
    adapter.clear collection.first
  end
end
