class Booking
  def initialize(file_processor, time)
    @time = format_time(time)
    @file_processor = file_processor
  end

  def book_a_doc
    available_slots = @file_processor.to_hash
    slots = available_slots['availability_slots']
    slots_empty?(slots)
    find_time = slots.index slots.detect { |el| el['time'] == @time }

    if find_time.nil?
      index = find_next_slot_index(slots)
      print_result(index, slots)
      slots.slice!(index, 1)
      update_file(available_slots)
    else
      print_result(find_time, slots)
      slots.slice!(find_time, 1)
      update_file(available_slots)
    end
  end

  def find_next_slot_index(slots)
    time_slots = []
    slots.each { |el| time_slots << el['time'] }
    time_slots << @time
    sorted = time_slots.sort
    check_next_index(sorted)
    sorted.index @time
  end

  def slots_empty?(slots)
    abort('No times are available') if slots.empty?
  end

  def check_next_index(time_slots)
    abort('No times are currently available!') if time_slots.last == @time
  end

  private

  def print_result(index, slots)
    puts format_for_print(slots[index]['time'])
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
