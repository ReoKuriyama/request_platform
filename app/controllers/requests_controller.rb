class RequestsController < ApplicationController
  def index
    request_categories = RequestCategory.all
    json_string = RequestCategorySerializer.new(request_categories ,{include: [:requests]}).serialized_json
    render json: json_string
  end

  def create
    request = Request.new(request_params)
    if request.save
      head :ok
    else
      
    end
  end

  private

  def request_params
    params.require(:request).permit(
      :creator,
      :summary,
      :office_id,
      :request_category_id
    )
  end
end
