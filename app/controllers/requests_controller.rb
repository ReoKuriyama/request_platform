class RequestsController < ApplicationController
  before_action :set_ticket, only: %i[index]
  before_action :set_request, only: %i[show update]

  def index
    if @ticket
      keywords = ExtractNouns.call(sentence: @ticket.all_text_info)

      tags = Tag.ransack(keyword_cont_any: keywords).result
      request_ids = []
      tags.each do |tag|
        request_ids.push(tag.requests.pluck(:id))
      end

      requests = Request.where(id: request_ids.flatten.uniq)
    else
      requests = Request.all.order('count DESC')
    end

    json_string = RequestSerializer.new(requests).serialized_json
    render json: json_string
  end

  def create
    request = Request.create(request_params)

    binding.pry
    tag1 = Tag.new(keyword: params[:request][:tags1])
    tag2 = Tag.new(keyword: params[:request][:tags2])

    tag1.request_ids = request.id
    tag2.request_ids = request.id

    tag1.save
    tag2.save

    head :ok
  end

  def show
    json_string = RequestSerializer.new(@request).serialized_json
    render json: json_string
  end

  def update
    if @request.update(request_params)
      head :ok
    else
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find_by(id: params[:ticket_id])
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(
      :summary,
      :description,
      :improvement_idea,
      :estimate,
      :function_impact,
      :office_scale,
      :request_category_id,
      :count
    )
  end
end
