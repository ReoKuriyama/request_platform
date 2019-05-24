class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[update]

  def index
    tickets = Ticket.unclassified_tickets
    json_string = TicketSerializer.new(tickets).serialized_json
    render json: json_string
  end

  def update
    if @ticket.update(ticket_params)
      request = Request.find(ticket_params[:request_id]).tap{|request| request.count += 1}
      request.save
      head :ok
    else
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :request_id
    )
  end
end
