# frozen_string_literal: true

module Api
  class Jira
    BASE_PATH = ENV['JIRA_API_HOST']
    ISSUE_SEARCH_PATH = BASE_PATH + '/rest/api/3/search'

    def initialize
      @client = Faraday::Connection.new(url: BASE_PATH) do |config|
        # basic_auth でやるとencode後が微妙に異なる。
        config.authorization :Basic, Base64.strict_encode64(ENV['JIRA_API_USERNAME'] + ':' + ENV['JIRA_API_TOKEN'])
        config.headers['Content-Type'] = 'application/json'
        config.headers['Accept'] = 'application/json'
        config.adapter Faraday.default_adapter
      end
    end

    def get_issues(&block)
      @client.post do |req|
        req.url ISSUE_SEARCH_PATH
        block.call(req)
      end
    end
  end
end
