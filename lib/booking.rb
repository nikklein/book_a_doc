class Booking
  def initialize(file_processor, time)
    @time = format_time(time)
    @file_processor = file_processor
  end

  def book_a_doc
    abort('No times are available') if slots.empty?
    index = find_slot(available_slots)
    abort('No times are currently available!') if index.nil?
    print_result(index, available_slots)
    update_slots(index, available_slots)
  end

  def update_slots(find_slot, available_slots)
    available_slots = available_slots
    slots.slice!(find_slot, 1)
    update_file(available_slots)
  end

  def find_slot(_available_slots)
    slots.index slots.detect { |el| el['time'] == @time || el['time'] > @time }
  end

  private

  def available_slots
    @file_processor.to_hash
  end

  def slots
    available_slots['availability_slots']
  end

  def print_result(index, _slots)
    puts format_for_print(slots[index]['time'])
  end

  def update_file(available_slots)
    @file_processor.write_to_file(available_slots)
  end

  def format_time(time)
    @time = time << ':00'
  end

  def format_for_print(time)
    time[0..-4]
  end
end
