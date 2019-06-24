class TicketSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :subject, :description, :zendesk_ticket_id, :all_comments, :request_id
end
