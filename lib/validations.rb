class Validations
  def initialize(time)
    @time = time
  end

  def validate_input
    abort("In order to book an appointment please specify the time.\n") if @time.nil?
    abort("Please use 24H time format, e.g, 09:30 or 14:30\n") unless @time =~ time_format
    abort("Appointments are avaialble between 08:00 and 15:00\n") unless time_in_range?
  end

  def time_in_range?
    working_hours = ['08:00'..'15:00']
    working_hours.any? { |range| range.cover? @time }
  end

  def time_format
    /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/
  end
end
