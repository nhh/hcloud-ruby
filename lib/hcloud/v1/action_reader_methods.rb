# frozen_string_literal: true

require 'json'
require 'byebug'

require 'hcloud/client'
require 'hcloud/v1/api_error'

module Hcloud
  module V1
    module ActionReaderMethods
      def all(status, sort)
        response = Hcloud::Client.http
                                 .get("https://api.hetzner.cloud/v1/actions?status=#{status}&sort=#{sort}")

        raw_actions = JSON.parse(response.to_s)
        raw_actions['actions'].map { |raw_action| Hcloud::V1::Action.new(raw_action) }
      end

      def find(id)
        raise ArgumentError, 'Provide a valid id!' unless id

        response = Hcloud::Client.http
                                 .get("https://api.hetzner.cloud/v1/actions/#{id}")
        raw_action = JSON.parse(response.to_s)
        Hcloud::V1::Action.new(raw_action)
      end
    end
  end
end
