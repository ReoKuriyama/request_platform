class RequestCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  has_many :requests, serializer: RequestSerializer

  #belongs_to :parent_request_category, class_name: 'RequestCategory', foreign_key: :parent_id, primary_key: :id
  #has_many :child_request_categories, class_name: 'RequestCategory', foreign_key: :parent_id, primary_key: :id
end
