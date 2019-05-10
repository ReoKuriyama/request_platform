class RequestSerializer
  include FastJsonapi::ObjectSerializer
  attributes :creator, :summary, :current_problem, :improvement_idea, :office_id, :estimate, :count, :status, :will_do, :created_at, :updated_at
end
