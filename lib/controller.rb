require_relative 'validations'

time = ARGV.first

def run_program(time)
  validator = Validations.new(time)
  validator.check_errors
end

run_program(time)
