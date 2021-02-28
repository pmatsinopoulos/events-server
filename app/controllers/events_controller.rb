class EventsController < ApplicationController
  def create
    event = RubyEventStore::Proto.new(
      data: "::Events::#{params[:event_class]}s::#{params[:event_type]}".constantize.new(
        params[:payload].as_json
      )
    )

    EventStore.event_store.publish(
      event,
      {
        stream_name: params[:stream_name]
      }.compact
    )

    render json: { result: 'ok', code: event.event_id }, status: :created
  end
end
