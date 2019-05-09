class Request < ApplicationRecord
  with_options presence: true do
    validates :creator
    validates :summary
    validates :current_problem
    validates :improvement_idea
    validates :office_id
    validates :estimate
    validates :count
    validates :status
    validates :will_do
  end
end 
