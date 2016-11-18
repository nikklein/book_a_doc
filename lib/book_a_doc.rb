abort("In order to book an appointment please specify the time.\n") if ARGV.empty?
abort("Please use correct time format, e.g, 12:40 or 2.30\n") unless ARGV.first =~ /^(1[0-2]|0?[1-9]):([0-5][0-9])$/
git
