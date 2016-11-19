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
    wrong_time = 3333
    run "ruby #{program_path} #{wrong_time}"

    stop_all_commands
    sleep(1)
    text2 = "Please use correct time format, e.g, 09:30 or 14:30\n"
    expect(last_command_started.output).to eq(text2)
  end
  it 'it prints an error if preffered time is not between 08:00 and 15:00' do
    setup_aruba
    program_path = ENV['FULL_PATH_TO_PROGRAM']
    run "ruby #{program_path} 04:00"

    stop_all_commands
    sleep(1)
    text2 = "Appointments are avaialble between 08:00 and 15:00\n"
    expect(last_command_started.output).to eq(text2)
  end
end
