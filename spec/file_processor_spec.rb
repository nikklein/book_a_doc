require_relative 'spec_helper.rb'
require './lib/file_processor'
require 'json'

describe FileProcessor do
  include FakeFS::SpecHelpers

  config = File.expand_path('../../lib/', __FILE__)
  file_name = 'availability_slots.json'
  subject(:processor) { described_class.new("#{config}/#{file_name}") }

  describe '#load_file' do
    FakeFS do
      FakeFS::FileSystem.clone(config)
      it 'loads a local file using the provided path' do
        file = File.read("#{config}/#{file_name}")
        expect(processor.load_file).to eq(file)
      end
    end
  end
  describe '#to_hash' do
    it 'convertes a JSON string into hash' do
      FakeFS::FileSystem.clone(config)
      expect(processor.to_hash).to be_instance_of(Hash)
    end
  end
end
