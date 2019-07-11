class TicketSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :subject, :description, :zendesk_ticket_id, :request_id
end
