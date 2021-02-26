RSpec.describe 'Rails event store has been set up correctly' do
  class DummyEvent < RailsEventStore::Event; end

  it 'publishes and event to the event store' do
    event = DummyEvent.new(data: {
                             order_id: 1,
                             order_data: 'sample',
                             festival_id: 'b2d506fd-409d-4ec7-b02f-c6d2295c7edd'
                           })

    expect do
      expect do
        EventStore.event_store.publish(
          event,
          stream_name: 'order_1'
        )
      end.to change(::RailsEventStoreActiveRecord::EventInStream, :count).by(1)
    end.to change(::RailsEventStoreActiveRecord::Event, :count).by(1)

    expect(EventStore.event_store).to have_published(an_event(DummyEvent)).in_stream('order_1')
  end
end
