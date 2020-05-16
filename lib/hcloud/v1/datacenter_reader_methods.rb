# frozen_string_literal: true

require 'json'
require 'byebug'

require 'hcloud/client'
require 'hcloud/v1/datacenter'

module Hcloud
  module V1
    module DatacenterReaderMethods
      def all(name = '')
        response = Hcloud::Client.http
                                 .get("https://api.hetzner.cloud/v1/datacenters#{name == '' ? '' : "?name=#{name}"}")

        raw_actions = JSON.parse(response.to_s)
        raw_actions['datacenters'].map { |raw_action| Hcloud::V1::Datacenter.new(raw_action) }
      end

      def find(id)
        raise ArgumentError, 'Provide a valid id!' unless id

        response = Hcloud::Client.http
                                 .get("https://api.hetzner.cloud/v1/datacenters/#{id}")
        raw_action = JSON.parse(response.to_s)
        Hcloud::V1::Datacenter.new(raw_action['datacenter'])
      end
    end
  end
end
