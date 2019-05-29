class RequestSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :request_category
  has_many :tags, through: :request_tags, serializer: TagSerializer
  has_many :tickets, serializer: TicketSerializer

  attributes :id, :summary, :description, :improvement_idea, :estimate, :count, :jira_ticket_id, :function_impact, :office_scale, :request_category_id

  attributes :category_name do |object|
    object.request_category&.name
  end
end
