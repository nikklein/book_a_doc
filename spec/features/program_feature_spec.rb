describe 'Test program output' do
  it 'it prints an error if no command line argument has been provided' do
    setup_aruba
    program_path = ENV['FULL_PATH_TO_PROGRAM']
    run "ruby #{program_path}"

    stop_all_commands
    sleep(1)
    text = "In order to book an appointment please specify the time.\n"
    expect(last_command_started.output).to eq(text)
  end

  it 'it prints an error if incorrect time format has been used during booking' do
    setup_aruba
    program_path = ENV['FULL_PATH_TO_PROGRAM']
    run "ruby #{program_path} wrong_time"

    stop_all_commands
    sleep(1)
    text = "Please use correct time format, e.g, 12:40 or 2.30\n"
    expect(last_command_started.output).to eq(text)
  end
end
