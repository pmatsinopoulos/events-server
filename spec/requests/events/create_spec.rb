RSpec.describe 'Create Event' do
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }
  let(:code) { SecureRandom.hex }
  let(:params) do
    {
      event_class: event_class,
      event_type: event_type,
      stream_name: stream_name,
      payload: {
        code: code
      }
    }.compact
  end

  context 'when Command event' do
    let(:event_class) { 'Command' }
    let(:event_type) { 'CreateOrder' }
    let(:payload) { { code: code } }
    let(:stream_name) { nil }

    it 'creates the event' do
      post '/events', params: params.to_json, headers: headers

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:created)
      response_decoded = ActiveSupport::JSON.decode(response.body)

      expect(response_decoded['result']).to eq('ok')
      expect(response_decoded['code']).not_to be_blank

      event_created = EventStore.event_store.read.last
      expect(event_created).to(be_an_event(::Events::Commands::CreateOrder))
      expect(event_created.data).to eq('code' => code)
      expect(response_decoded['code']).to eq(event_created.event_id)
    end

    context 'when stream name is specified' do
      let(:stream_name) { 'foo stream' }

      it 'publishes the event to the stream name' do
        post '/events', params: params.to_json, headers: headers

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:created)

        event_created = EventStore.event_store.read.stream(stream_name).last
        expect(event_created).to(be_an_event(::Events::Commands::CreateOrder))
        expect(event_created.data).to eq('code' => code)
      end
    end
  end
end
