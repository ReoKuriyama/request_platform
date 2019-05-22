# frozen_string_literal: true

module Api
  module Zendesk
    class Base
      BASE_PATH = ENV['ZENDESK_API_HOST'].freeze

      def initialize
        @client = Faraday::Connection.new(url: BASE_PATH) do |config|
          # basic_auth でやるとencode後が微妙に異なる。
          config.authorization :Basic, Base64.strict_encode64(ENV['ZENDESK_API_USERNAME'] + "/token:" + ENV['ZENDESK_API_TOKEN'])
          config.adapter Faraday.default_adapter
        end
      end
    end
  end
end
