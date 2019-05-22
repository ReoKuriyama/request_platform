class Request < ApplicationRecord
  has_many :tickets
  belongs_to :request_category

  with_options presence: true do
    validates :summary
    #validates :current_problem
    #validates :improvement_idea
    #validates :estimate
    #validates :count
    #validates :status
    #validates :will_do
  end
end 
