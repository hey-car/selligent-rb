# frozen_string_literal: true

require 'selligent/configuration'
require 'selligent/connection'

module Selligent
  # The actual Selligent client
  class Client
    include Selligent::Configuration
    include Selligent::Connection

    def initialize(options = {})
      options.each do |key, value|
        Selligent::Configuration.set(key, value)
      end
    end

    def inspect
      inspected = super

      inspected = inspected.gsub! @api_key, '*******' if @api_key

      inspected
    end
  end
end
