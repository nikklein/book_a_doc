require './lib/booking'
require 'fakefs/safe'

describe Booking do
  include FakeFS::SpecHelpers

  FakeFS do
    config = File.expand_path('../../lib', __FILE__)
    file_name = '/availability_slots.json'
    path_to_file = config << file_name

    describe '#book_a_doc' do
      it 'allows to book a time' do
        FakeFS::FileSystem.clone(config)
        time = '08:30'
        file_processor = FileProcessor.new(path_to_file)
        booking = Booking.new(file_processor, time)
        expect { booking.book_a_doc }.to output("08:30\n").to_stdout
      end
    end
  end
end
