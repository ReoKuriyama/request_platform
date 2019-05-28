class Request < ApplicationRecord
  has_many :tickets
  belongs_to :request_category, optional: true

  has_many :request_tags
  has_many :tags, through: :request_tags

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
