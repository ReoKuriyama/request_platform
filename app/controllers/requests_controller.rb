class RequestsController < ApplicationController
  before_action :set_request, only: %i[show update]

  def index
    requests = Request.all.order('count DESC')

    json_string = RequestSerializer.new(requests).serialized_json
    render json: json_string
  end

  def create
    request = Request.new(request_params)
    if request.save
      head :ok
    else
    end
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

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(
      :summary,
      :request_category_id,
      :count
    )
  end
end
