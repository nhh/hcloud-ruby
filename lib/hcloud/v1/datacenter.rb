# frozen_string_literal: true

require 'hcloud/v1/datacenter_reader_methods'
require 'hcloud/dynamic_attributes_initializer'

module Hcloud
  module V1
    class Datacenter
      include DynamicAttributesInitializer
      # There are reader and writer methods, as class or instance methods. so we separate them
      extend DatacenterReaderMethods
      attr_reader :id, :name, :description, :location, :server_types

      def to_s
        inspect
      end
    end
  end
end
