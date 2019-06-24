class GetRequestsController < ApplicationController
  def show
    request_ticket_json = Api::Zendesk::Ticket.new.show(params[:id])[:ticket]
    request_comments_json = Api::Zendesk::Comment.new.index(params[:id])[:comments]

    joined_comments = JoinZendeskComment.call(comments: request_comments_json)

    ticket = Ticket.new(subject: request_ticket_json[:subject], description: request_ticket_json[:description], all_comments: joined_comments, zendesk_ticket_id: request_ticket_json[:id]) 

    if ticket.save
      json_string = TicketSerializer.new(ticket).serialized_json
      render json: json_string
    else

    end
  end
end
