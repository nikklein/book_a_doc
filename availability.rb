#!/usr/bin/env ruby

require_relative 'lib/validations.rb'
require_relative'lib/booking'
require_relative 'lib/file_processor'

time = ARGV.first
path = './lib/availability_slots.json'

def run_program(time, path)
  validator = Validations.new(time)
  validator.validate_input
  file_processor = FileProcessor.new(path)
  time = time.dup
  booking = Booking.new(file_processor, time)
  booking.book_a_doc
end

run_program(time, path)
