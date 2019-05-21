class RequestCategoriesController < ApplicationController

  def index
    request_categories = RequestCategory.all
    json_string = RequestCategorySerializer.new(request_categories, include: [:requests]).serialized_json
    render json: json_string
  end
end
