class Booking
  def initialize(file_processor, time)
    @time = format_time(time)
    @file_processor = file_processor
  end

  def book_a_doc
    available_slots = @file_processor.to_hash
    slots = available_slots['availability_slots']
    puts 'No times are available' if slots.empty?

    find_time = slots.index slots.detect { |el| el['time'] == @time }

    if find_time.nil?
      index = find_next_slot_index(slots)
      slice = slots.slice!(index, 1)
      update_file(available_slots)
      puts format_for_print(slice['time'])
    else
      puts format_for_print(slots[find_time]['time'])
      slots.slice!(find_time, 1)
      update_file(available_slots)
    end
  end

  private

  def check_next_index(time_slots)
    if time_slots.last == @time
      puts 'No times are currently available'
      exit
    end
  end

  def find_next_slot_index(slots)
    time_slots = []
    slots.each { |el| time_slots << el['time'] }
    time_slots << @time
    sorted = time_slots.sort
    check_next_index(time_slots)
    sorted.index @time
  end

  def update_file(available_slots)
    @file_processor.write_to_file(available_slots)
  end

  def format_time(time)
    time[-1] == '0' ? @time = time << ':00' : @time = time.split(':').first << ':' << ((time.split(':').last.to_i / 10.0).ceil * 10).to_s << ':00'
  end

  def format_for_print(time)
    time[0..-4]
  end
end
