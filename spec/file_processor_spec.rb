require './lib/file_processor'
require 'json'
require 'fakefs/safe'

describe FileProcessor do
  include FakeFS::SpecHelpers

  FakeFS do
    config = File.expand_path('../../lib', __FILE__)
    file_name = '/availability_slots.json'
    path_to_file = config << file_name

    subject(:processor) { described_class.new(path_to_file) }

    describe '#load_file' do
      it 'loads a local file using the provided path' do
        FakeFS::FileSystem.clone(config)
        file = File.read(path_to_file)
        expect(processor.load_file).to eq(file)
      end
    end

    describe '#to_hash' do
      it 'convertes a JSON string into hash' do
        FakeFS::FileSystem.clone(config)
        expect(processor.to_hash).to be_instance_of(Hash)
      end
    end

    describe '#write_to_file'  do
      it 'writes a dataset to a file' do
        FakeFS::FileSystem.clone(config)
        processor.load_file

        dataset = {
          "time":"08:00:00",
          "slot_size":10,
          "doctor_id":1
        }.to_json

        processor.write_to_file(dataset)
        expect(processor.load_file).to eq(dataset)
      end
    end
  end
end
