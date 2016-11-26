# require './lib/booking'
#
# describe Booking do
#   describe '#find_next_slot_index' do
#     it 'finds an index of the next slot' do
#       anything = double('anything')
#       booking = Booking.new(anything, '08:30')
#       slot = [{ 'time' => '08:40:00' }]
#       expect(booking.find_next_slot_index(slot)).to eq(0)
#     end
#   end
#   # describe '#check_next_index' do
#   #   it 'checks index of the next slot' do
#   #     booking = Booking.new('/', '08:30')
#   #     time_slots = ['08:30:00']
#   #     begin
#   #       booking.check_next_index(time_slots)
#   #     rescue SystemExit => e
#   #       expect(e.status).to eq(1)
#   #     end
#   #   end
#   # end
# end
