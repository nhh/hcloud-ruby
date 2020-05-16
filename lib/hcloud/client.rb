# frozen_string_literal: true

require 'http'

require 'hcloud/v1/error_instrumenter'

module Hcloud
  class Client
    def self.configure(configuration)
      raise ArgumentError, 'Please provide a valid configuration token!' unless configuration[:token]

      Thread.current[:hcloud_token] = configuration[:token]
    end

    def self.token
      raise ArgumentError, 'Please provide a valid configuration token!' unless Thread.current[:hcloud_token]

      Thread.current[:hcloud_token]
    end

    def self.http
      HTTP
        .headers("Authorization": "Bearer #{token}")
        .use(instrumentation: { instrumenter: Hcloud::V1::ErrorInstrumenter.new })
    end
  end
end
