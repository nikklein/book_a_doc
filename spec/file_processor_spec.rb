require_relative 'spec_helper.rb'
require './lib/file_processor'
require 'json'

describe FileProcessor do
  include FakeFS::SpecHelpers

  FakeFS do
    config = File.expand_path('../../lib/availability_slots.json', __FILE__)

    FakeFS::FileSystem.clone(config)

    subject(:processor) { described_class.new(config) }
    # file_processor = FileProcessor.new(config)
    # expect(file_processor).to respond_to(:to_hash)
    describe '#to_hash' do
      it 'parses JSON string to hash' do
        expect(processor.to_hash).to be_instance_of(Hash)

        # it 'can be reported broken' do
        # subject.report_broken
        # expect(subject).to be_broken

        # File.write("#{config}/foo.yml"), "NEW")
        # expect(File.read("#{config}/foo.yml")).to eq "NEW"
      end
    end
  end
end
