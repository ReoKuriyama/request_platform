class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|

      t.string :subject
      t.string :description # The first comment on the ticket
      t.text :all_comments
      t.integer :zendesk_ticket_id
      t.references :request

      t.timestamps
    end
  end
end
