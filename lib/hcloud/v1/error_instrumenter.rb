# frozen_string_literal: true

require 'http'
require 'hcloud/v1/api_error'

module Hcloud
  module V1
    class ErrorInstrumenter
      def instrument(name, payload = {}); end

      def start(_name, _payload)
        true
      end

      def finish(_name, payload)
        parsed_response = JSON.parse(payload[:response].to_s)

        raise Hcloud::V1::ApiError, parsed_response if parsed_response['error']

        true
      end
    end
  end
end
