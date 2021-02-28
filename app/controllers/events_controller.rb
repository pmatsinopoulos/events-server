class EventsController < ApplicationController
  def create
    kafka = EventsServer::Kafka.new.kafka

    event = "::Events::#{params[:event_class]}s::#{params[:event_type]}".constantize.new(
      data: params[:payload]
    )

    kafka.deliver_message(ActiveSupport::JSON.encode(event), topic: 'events')

    render json: { result: 'ok', code: event.event_id }, status: :created
  end
end
