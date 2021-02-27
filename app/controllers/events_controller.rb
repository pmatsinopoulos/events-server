class EventsController < ApplicationController
  def create
    event = "::Events::#{params[:event_class]}s::#{params[:event_type]}".constantize.new(
      data: params[:payload]
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
