class RequestsController < ApplicationController
  before_action :set_request, only: %i[update]

  def index
    request_categories = RequestCategory.all
    json_string = RequestCategorySerializer.new(request_categories, include: [:requests]).serialized_json
    render json: json_string
  end

  def create
    request = Request.new(request_params)
    if request.save
      head :ok
    else
    end
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
      :creator,
      :summary,
      :office_id,
      :request_category_id,
      :count
    )
  end
end
