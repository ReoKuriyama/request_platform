class TicketSerializer
  include FastJsonapi::ObjectSerializer

  attributes :subject, :description, :zendesk_ticket_id, :all_comments
end
