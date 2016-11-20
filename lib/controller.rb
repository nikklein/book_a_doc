require 'dotenv'
Dotenv.load
require_relative 'validations'
require_relative 'booking'
require_relative 'file_processor'

time = ARGV.first
path = ENV['FULL_PATH_TO_JSON']

def run_program(time, path)
  validator = Validations.new(time)
  validator.validate_input
  file_processor = FileProcessor.new(path)
  time = time.dup
  booking = Booking.new(file_processor, time)
  booking.book_a_doc
end

run_program(time, path)
