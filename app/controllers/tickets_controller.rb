class TicketsController < ApplicationController
  def index
    tickets = Ticket.unclassified_tickets
    json_string = TicketSerializer.new(tickets).serialized_json
    render json: json_string
  end
end
