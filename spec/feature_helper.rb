def aruba
  setup_aruba
  program_path = ENV['FULL_PATH_TO_PROGRAM']
  run "ruby #{program_path}"

  stop_all_commands
  sleep(1)
end
