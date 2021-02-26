module EventStore
  class << self
    def event_store
      Rails.configuration.event_store
    end
  end
end
