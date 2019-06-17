class RequestsController < ApplicationController
  before_action :set_ticket, only: %i[index]
  before_action :set_request, only: %i[show update]

  def index
    if @ticket # チケットも渡された場合は、チケットのコメントからひも付きそうな要望を表示する
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

    json_string = RequestSerializer.new(requests, include: [:tags]).serialized_json
    render json: json_string
  end

  def create
    Request.create(request_params)

    head :ok
  end

  def show
    json_string = RequestSerializer.new(@request, include: [:tags, :tickets]).serialized_json
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
    @request_params = params.require(:request).permit(
      :id,
      :summary,
      :description,
      :improvement_idea,
      :estimate,
      :function_impact,
      :office_scale,
      :request_category_id,
      :count,
      tag_ids: []
    )

    new_tags = params[:request][:tags]

    if new_tags
      @request_params[:tag_ids] = []
      new_tags.each do |new_tag|
        tag = Tag.find_or_create_by(keyword: new_tag[:text])
        @request_params[:tag_ids] << tag.id
      end
    end

    @request_params
  end
end
