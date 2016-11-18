def time_in_range?(time)
  working_hours = ['08:00'..'3:00']
  working_hours.any? { |range| range.cover? time }
end
preffered_time = ARGV.first
time_format = /^(1[0-2]|0?[1-9]):([0-5][0-9])$/
abort("In order to book an appointment please specify the time.\n") if ARGV.empty?
abort("Please use correct time format, e.g, 12:40 or 2.30\n") unless preffered_time =~ time_format
abort("Appointments are avaialble between 08:00 and 3:00\n") unless time_in_range? preffered_time
