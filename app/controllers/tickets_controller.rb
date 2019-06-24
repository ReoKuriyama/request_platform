class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[update classify reclassify]

  def index
    tickets = Ticket.unclassified_tickets
    json_string = TicketSerializer.new(tickets).serialized_json
    render json: json_string
  end

  def update
  end

  def classify
    Ticket.transaction do
      @ticket.update!(ticket_params)
      @ticket.request.update!(count: @ticket.request.count + 1)
    end

    head :ok
  end

  def reclassify
    Ticket.transaction do
      @ticket.request.update!(count: @ticket.request.count - 1)
      @ticket.update!(request_id: nil)
    end

    head :ok
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
