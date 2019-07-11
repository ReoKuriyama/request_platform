# frozen_string_literal: true

module Api
  module Jira
    class Issue < Api::Jira::Base
      def search(latest_ticket_id:)
        resources_path = BASE_PATH + '/rest/api/3/search'

        json = @client.post do |req|
          req.url resources_path
          req.body = {
            jql: "id > #{latest_ticket_id}",
            maxResults: 15,
            fieldsByKeys: false,
            fields: [
              "summary",
              "customfield_10043",
              "customfield_10044",
              "customfield_10045",
              "customfield_10046"
            ]
          }.to_json
        end

        JSON.parse(json.body, { symbolize_names: true })
      end
    end
  end
end
