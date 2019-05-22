# frozen_string_literal: true

module Api
  module Zendesk
    class Comment < Api::Zendesk::Base
      def index(ticket_id)
        resources_path = BASE_PATH + "/tickets/#{ticket_id}/comments.json".freeze
        json = @client.get(resources_path)
        JSON.parse(json.body, { symbolize_names: true })
      end
    end
  end
end
