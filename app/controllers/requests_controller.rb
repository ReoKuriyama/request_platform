class RequestsController < ApplicationController
  def index
    requests = Request.all
    json_string = RequestSerializer.new(requests).serialized_json
    render json: json_string
  end
end
