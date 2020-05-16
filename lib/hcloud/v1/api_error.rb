# frozen_string_literal: true

module Hcloud
  module V1
    class ApiError < RuntimeError
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def to_s
        @response.to_s
      end
    end
  end
end
