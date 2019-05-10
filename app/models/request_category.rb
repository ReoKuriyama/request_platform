class RequestCategory < ApplicationRecord
  has_many :requests

  belongs_to :parent_request_category, class_name: 'RequestCategory', foreign_key: :parent_id, primary_key: :id
  has_many :child_request_categories, class_name: 'RequestCategory', foreign_key: :parent_id, primary_key: :id

  validates :name, presence: true
end
