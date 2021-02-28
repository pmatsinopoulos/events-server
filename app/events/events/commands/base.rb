module Events
  module Commands
    class Base
      def initialize(data:)
        @data = data
        @event_id = SecureRandom.urlsafe_base64
      end

      attr_accessor :data
      attr_reader :event_id
    end
  end
end
