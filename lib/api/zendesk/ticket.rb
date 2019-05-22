# frozen_string_literal: true

module Api
  module Zendesk
    class Ticket < Api::Zendesk::Base
      def show(id)
        resources_path = BASE_PATH + "/tickets/#{id}.json".freeze
        json = @client.get(resources_path)
        JSON.parse(json.body, { symbolize_names: true })
      end
    end
  end
end
