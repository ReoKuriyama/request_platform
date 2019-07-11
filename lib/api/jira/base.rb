# frozen_string_literal: true

module Api
  module Jira
    class Base
      BASE_PATH = ENV['JIRA_API_HOST']

      def initialize
        @client = Faraday::Connection.new(url: BASE_PATH) do |config|
          # basic_auth でやるとencode後が微妙に異なる。
          config.authorization :Basic, Base64.strict_encode64(ENV['JIRA_API_USERNAME'] + ':' + ENV['JIRA_API_TOKEN'])
          config.headers['Content-Type'] = 'application/json'
          config.headers['Accept'] = 'application/json'
          config.adapter Faraday.default_adapter
        end
      end
    end
  end
end
