require_relative 'validations'

time = ARGV.first

def run_program(time)
  validator = Validations.new(time)
  validator.validate_input
end

run_program(time)
