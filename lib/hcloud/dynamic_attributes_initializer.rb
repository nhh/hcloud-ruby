# frozen_string_literal: true

module Hcloud
  module DynamicAttributesInitializer
    # Assign only instance variables which the object actually responds to
    def initialize(attributes)
      attributes
        .filter { |key, _| respond_to?(key.to_sym) }
        .each { |key, value| instance_variable_set("@#{key}", value) }
    end
  end
end
