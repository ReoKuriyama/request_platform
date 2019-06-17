class TagsController < ApplicationController
  def index
    @tags = Tag.all if params[:search_word].blank?

    json_string = TagSerializer.new(@tags).serialized_json
    render json: json_string
  end
end
