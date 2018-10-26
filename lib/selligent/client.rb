# frozen_string_literal: true

require 'selligent/configuration'
require 'selligent/connection'
require 'selligent/client/journeys'
require 'selligent/client/lists'
require 'selligent/client/stored_procedures'
require 'selligent/client/transactionals'
require 'selligent/middlewares/authorization'

module Selligent
  # The actual Selligent client
  class Client
    extend Forwardable

    include Selligent::Connection
    include Selligent::Client::Journeys
    include Selligent::Client::Lists
    include Selligent::Client::StoredProcedures
    include Selligent::Client::Transactionals

    attr_reader :config

    def initialize(options = {})
      Selligent::Middlewares::Authorization.setup!
      @config = Selligent::Configuration.new(options)
    end

    def configure
      yield config
    end

    def base_url
      "/Portal/Api/organizations/#{config.organization}"
    end
  end
end
