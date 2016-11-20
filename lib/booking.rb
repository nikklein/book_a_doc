class Booking
  def initialize(file_processor, time)
    @time = time
    @file_processor = file_processor
  end

  def book_a_doc
    available_slots = @file_processor.to_hash
    slots = available_slots['availability_slots']
    puts 'No time avaialble' if slots.empty?

    select_time = slots.index slots.detect { |el| el['time'] == @time }
    if select_time.nil?
      index = find_next_slot_index(slots)
      puts format_for_print(slice_a_slot(slots, index).first['time'])
      update_file(available_slots)

    else
      print_time(slots, select_time)
      update_file(available_slots)
    end
  end

  def find_next_slot_index(slots)
    time_slots = []
    slots.each { |el| time_slots << el['time'] }
    time_slots << @time
    sorted = time_slots.sort
    index = sorted.index @time
    if sorted[index + 1].nil?
      puts "Last avaialble time #{format_for_print(sorted[index - 1])}"
      exit
    else
      index
    end
  end

  private

  def print_time
    puts format_for_print(slice_a_slot(slots, select_time)).first['time']
  end

  def slice_a_slot(slots, index)
    slots.slice!(index, 1)
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
