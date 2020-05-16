# frozen_string_literal: true

require 'hcloud/v1/action_reader_methods'
require 'hcloud/dynamic_attributes_initializer'

module Hcloud
  module V1
    class Action
      include DynamicAttributesInitializer
      # There are reader and writer methods, as class or instance methods. so we separate them
      extend ActionReaderMethods
      attr_reader :id, :command, :status, :progress, :started, :finished, :resources, :error
    end
  end
end
