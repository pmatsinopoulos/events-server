module EventsServer
  class Kafka
    def initialize
      @kafka = ::Kafka.new(['localhost:9092'], client_id: 'events-server')
    end

    attr_reader :kafka
  end
end

