class Ticket < ApplicationRecord
  belongs_to :request, optional: true # 仕分けるまでは外部キーが入らない

  with_options presence: true do
    validates :subject
    validates :description
    validates :zendesk_ticket_id
    validates :all_comments
  end

  validates :zendesk_ticket_id, uniqueness: true

  def self.unclassified_tickets
    where(request_id: nil)
  end
end
