require_relative 'spec_helper.rb'
require './lib/file_processor'
require 'json'

describe FileProcessor do
  include FakeFS::SpecHelpers

  FakeFS do
    config = File.expand_path('../../lib/availability_slots.json', __FILE__)

    FakeFS::FileSystem.clone(config)

    subject(:processor) { described_class.new(config) }

    describe '#to_hash' do
      it 'parses JSON string to hash' do
        expect(processor.to_hash).to be_instance_of(Hash)
      end
    end
  end
end
