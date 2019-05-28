class Tag < ApplicationRecord
  has_many :request_tags
  has_many :requests, through: :request_tags

  with_options presence: true do
    validates :keyword
  end
end
