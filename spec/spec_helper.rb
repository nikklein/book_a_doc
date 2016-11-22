require 'simplecov'
SimpleCov.start
require 'pp'
require 'fakefs/safe'
require 'fakefs/spec_helpers'
require 'rspec/json_expectations'
require 'aruba'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Aruba::Api

  config.include FakeFS::SpecHelpers, fakefs: true

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if RUBY_VERSION < '1.9.3'
  ::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each { |f| require File.join(File.dirname(f), File.basename(f, '.rb')) }
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require File.join(File.dirname(f), File.basename(f, '.rb')) }
else
  ::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each { |f| require_relative f }
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require_relative f }
end
