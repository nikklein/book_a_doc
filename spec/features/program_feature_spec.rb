describe 'Test program output' do
  it 'it should print an error if no command line argument is provided' do
    setup_aruba
    program_path = ENV['FULL_PATH_TO_PROGRAM']
    run "ruby #{program_path}"

    stop_all_commands
    sleep(1)
    text = "In order to book an appointment please specify the time.\n"
    expect(last_command_started.output).to eq(text)
  end
end
