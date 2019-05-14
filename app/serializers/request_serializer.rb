class RequestSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :request_category

  attributes :creator, :summary, :current_problem, :improvement_idea, :office_id, :estimate, :count, :status, :will_do

  attributes :created_at do |object|
    object.created_at.strftime('%Y/%m/%d')
  end
end
