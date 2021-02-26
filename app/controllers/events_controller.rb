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

    render json: { result: 'ok' }, status: :created
  end
end
