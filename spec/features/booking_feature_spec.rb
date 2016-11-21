require '././lib/booking'
require '././lib/file_processor'
require 'fakefs/safe'

describe 'Booking' do
  include FakeFS::SpecHelpers

  config = File.expand_path('../../../lib', __FILE__)
  file_name = '/availability_slots.json'
  path_to_file = config << file_name

  FakeFS do
    describe '#book_a_doc' do
      it 'allows to book a time if preffered time matches an available time slot' do
        FakeFS::FileSystem.clone(config)
        time = '08:30'
        file_processor = FileProcessor.new(path_to_file)
        booking = Booking.new(file_processor, time)
        expect { booking.book_a_doc }.to output("08:30\n").to_stdout
      end
      it "allows to book the next time slot if preffered time doesn't match an available time slot" do
        FakeFS::FileSystem.clone(config)
        time = '12:03'
        file_processor = FileProcessor.new(path_to_file)
        booking = Booking.new(file_processor, time)
        expect { booking.book_a_doc }.to output("12:10\n").to_stdout
      end
    end
  end
end
